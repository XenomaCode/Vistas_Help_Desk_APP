import UIKit

class TicketTableTecnicoViewCell: UITableViewCell {

    let ticketIDLabel = UILabel()
    let tituloLabel = UILabel()
    let descripcionLabel = UILabel()
    let ubicacionLabel = UILabel()
    let categoriaLabel = UILabel()
    let prioridadLabel = UILabel()
    let estadoPicker = UIPickerView()
    
    let estados = ["Nuevo", "Asignado", "En proceso", "Resuelto"]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        estadoPicker.delegate = self
        estadoPicker.dataSource = self
        
        let stackView = UIStackView(arrangedSubviews: [ticketIDLabel, tituloLabel, descripcionLabel, ubicacionLabel, categoriaLabel, prioridadLabel, estadoPicker])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}

extension TicketTableTecnicoViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return estados.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return estados[row]
    }
}
