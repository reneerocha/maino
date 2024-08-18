class FilesController < ApplicationController
  def upload
      uploaded_file = params[:file]
      if file_sent?(uploaded_file)
          xml_data = File.read(uploaded_file)
           if valid_xml?(xml_data)
              parsed_xml = Hash.from_xml(xml_data)
              InvoiceJob.perform_later(parsed_xml)
              redirect_to invoices_path, notice: "Importação do XML acontencerá em instantes"  
           else
            redirect_to invoices_path, alert: "Arquivo inválido"
           end
      else
          redirect_to invoices_path, alert: "Selecione o arquivo" 
      end
  end

  private

  def file_sent?(uploaded_file)
      File.open(uploaded_file)
          true
      rescue TypeError => e
          false
  end

  def valid_xml?(xml)
    begin
      Hash.from_xml(xml)
      true
    rescue Exception => e
      false
    end
  end
end
