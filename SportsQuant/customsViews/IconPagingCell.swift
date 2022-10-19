import Parchment
import UIKit

var mydict = [String:UIImage]()

struct IconPagingCellViewModel {
    let image: UIImage?
    let selected: Bool
    let tintColor: UIColor
    let selectedTintColor: UIColor
    let title:String

    init(image: UIImage?, selected: Bool,title:String, options: PagingOptions) {
        self.image = image
        self.selected = selected
        tintColor = options.textColor
        self.title = title
        selectedTintColor = options.selectedTextColor
    }
}

class IconViewPagingCell: PagingCell {
    fileprivate var viewModel: IconPagingCellViewModel?

    fileprivate lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
//        imageView.layer.cornerRadius = 20
//        imageView.layer.masksToBounds = true
        return imageView
    }()
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor(white: 0, alpha: 0.6)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)

        let homeSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 55, weight: .black)

        let i1 = UIImage(systemName: "person.circle.fill", withConfiguration: homeSymbolConfiguration)
        
        let i2 = UIImage(systemName: "pencil.circle.fill", withConfiguration: homeSymbolConfiguration)

        
        let i3 = UIImage(systemName: "graduationcap.circle.fill", withConfiguration: homeSymbolConfiguration)

        
        let i4 = UIImage(systemName: "book.circle.fill", withConfiguration: homeSymbolConfiguration)

        
        let i5 = UIImage(systemName: "house", withConfiguration: homeSymbolConfiguration)

        
        let i6 = UIImage(systemName: "bookmark.circle.fill", withConfiguration: homeSymbolConfiguration)

        let i7 = UIImage(systemName: "plus.circle.fill", withConfiguration: homeSymbolConfiguration)

        let i8 = UIImage(systemName: "checkmark.circle.fill", withConfiguration: homeSymbolConfiguration)


        
        mydict = ["Intro":i1!, "Contact":i2!, "Education":i3!, "Work":i4!, "Summary":i5!, "Additional":i6!, "Finish":i7!]
        
        
        setupConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setPagingItem(_ pagingItem: PagingItem, selected: Bool, options: PagingOptions) {
        if let item = pagingItem as? IconItem {
            let viewModel = IconPagingCellViewModel(
                image: item.image,
                selected: selected, title: item.title,
                options: options
            )

            imageView.image = mydict[viewModel.title]
            titleLabel.text = viewModel.title
            self.contentView.backgroundColor = #colorLiteral(red: 0.0829134658, green: 0.2267663181, blue: 0.5822093487, alpha: 1)
            if viewModel.selected {
                imageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                imageView.tintColor = UIColor.white
                titleLabel.textColor = UIColor.white
            } else {
                imageView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                imageView.tintColor = UIColor(white: 0, alpha: 0.8)
                titleLabel.textColor = UIColor(white: 0, alpha: 0.8)
            }

            self.viewModel = viewModel
        }
    }

    open override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        guard let viewModel = viewModel else { return }
        if let attributes = layoutAttributes as? PagingCellLayoutAttributes {
            let scale = (0.4 * attributes.progress) + 0.6
            imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
            imageView.tintColor = UIColor.interpolate(
                from: viewModel.tintColor,
                to: viewModel.selectedTintColor,
                with: attributes.progress
            )
        }
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addConstraints([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])

    }
}

extension UIColor {
    func components() -> (CGFloat, CGFloat, CGFloat, CGFloat) {
        guard let c = cgColor.components else { return (0, 0, 0, 1) }
        if cgColor.numberOfComponents == 2 {
            return (c[0], c[0], c[0], c[1])
        } else {
            return (c[0], c[1], c[2], c[3])
        }
    }

    static func interpolate(from: UIColor, to: UIColor, with fraction: CGFloat) -> UIColor {
        let f = min(1, max(0, fraction))
        let c1 = from.components()
        let c2 = to.components()
        let r = c1.0 + (c2.0 - c1.0) * f
        let g = c1.1 + (c2.1 - c1.1) * f
        let b = c1.2 + (c2.2 - c1.2) * f
        let a = c1.3 + (c2.3 - c1.3) * f
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
