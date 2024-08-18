class InvoiceJob < ApplicationJob
  queue_as :default

  def perform(parsed_xml)
    parsed_xml.each do |hash|
      invoice = Invoice.new(
      serie: hash[1]["infNFe"]["ide"]["serie"],
      nnf: hash[1]["infNFe"]["ide"]["nNF"],
      dhemi: hash[1]["infNFe"]["ide"]["dhEmi"],
      emit: hash[1]["infNFe"]["emit"]["xNome"],
      xnome: hash[1]["infNFe"]["dest"]["xNome"],
      total_vnf: hash[1]["infNFe"]["total"]["ICMSTot"]["vNF"],
      total_vtotrib: hash[1]["infNFe"]["total"]["ICMSTot"]["vTotTrib"]
      )
      invoice.save!

      hash[1]["infNFe"]["det"].each do |p|
        product = Product.new(
          nitem: p["nItem"],
          xprod: p["prod"]["xProd"],
          ncm: p["prod"]["NCM"],
          cfop: p["prod"]["CFOP"],
          ucom: p["prod"]["uCom"],
          qcom: p["prod"]["qCom"],
          vuncom: p["prod"]["vUnCom"],
          vicms: p["imposto"]["ICMS"]["ICMS00"]["vICMS"],
          vipi: p["imposto"]["IPI"]["IPITrib"].nil? ? 0 : p["imposto"]["IPI"]["IPITrib"]["vIPI"],
          vpis: p["imposto"]["PIS"]["vPIS"].nil? ? 0 : p["imposto"]["PIS"]["vPIS"],
          vcofins: p["imposto"]["COFINS"]["vCOFINS"].nil? ? 0 : p["imposto"]["COFINS"]["vCOFINS"],
          invoice: invoice
        )
        product.save!
      end
    end
  end
end
