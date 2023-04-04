import UIKit
import SkeletonView

fileprivate var inited = false

class BonusView: UIView {

    private var cashbackCVPlaceholder = BonusViewConstants.COMMON_VIEW()
    private var cashbackCV = BonusViewConstants.cashbackCV()
    
    private var HOW_TO_GET_BONUSES = BonusViewConstants.CASHBACK_LABEL(text: "Как получить бонусы")
    
    private var inviteFriendsView = BonusViewConstants.COMMON_VIEW()
    private var BOX_ICON = BonusViewConstants.BOX_ICON
    private var INVITE_FRIENDS = BonusViewConstants.CASHBACK_LABEL(text: "Приглашайте друзей")
    private var YOU_WILL_RECIEVE = BonusViewConstants.YOU_WILL_RECIEVE
    
    private var tinkoffProImage = BonusViewConstants.TINKOFF_PRO_IMAGE
    private var detailsButton = BonusViewConstants.DETAILS_BUTTON
    private var detailsLabel = BonusViewConstants.DETAILS_LABEL
    
    private var partnerCashbackView = BonusViewConstants.COMMON_VIEW()
    private var ON_ALL_CARDS = BonusViewConstants.ON_CARDS()
    private var PARTNERS_CASHBACK = BonusViewConstants.CASHBACK_LABEL(text: "Кэшбэк у партнеров")
    private var partnerCashbackCV = BonusViewConstants.partnerCashbackCV
    private var ALL_OFFERS_BUTTON = BonusViewConstants.BONUS_BUTTON()
    private var ALL_OFFERS = BonusViewConstants.BUTTON_LABEL(text: "Все 301 предложений")
    
    private var sharesBuyView = BonusViewConstants.COMMON_VIEW()
    private var SHARES_BUY = BonusViewConstants.CASHBACK_LABEL(text: "Покупка Долями")
    private var sharesBuyCV = BonusViewConstants.sharesBuyCV
    private var CHECK_ALL_OFFERS_BUTTON_SHARES = BonusViewConstants.BONUS_BUTTON()
    private var CHECK_ALL_OFFERS_SHARES = BonusViewConstants.BUTTON_LABEL()
    
    private var partnerSubsView = BonusViewConstants.COMMON_VIEW()
    private var ON_ALL_CARDS_2 = BonusViewConstants.ON_CARDS()
    private var PARTNERS_SUBS = BonusViewConstants.CASHBACK_LABEL(text: "Подписки партнеров")
    private var partnerSubsCV = BonusViewConstants.partnerSubsCV
    private var CHECK_ALL_OFFERS_BUTTON_SUBS = BonusViewConstants.BONUS_BUTTON()
    private var CHECK_ALL_OFFERS_SUBS = BonusViewConstants.BUTTON_LABEL()
    
    private var chosenCashbackView = BonusViewConstants.COMMON_VIEW()
    private var ON_TINKOFF_BLACK = BonusViewConstants.ON_CARDS(text: "По Tinkoff Black")
    private var INCREASED_CASHBACK = BonusViewConstants.CASHBACK_LABEL(text: "Повыешнный кэшбэк на \(CalendarConstants.calendarNominativeCase[Calendar.current.component(.month, from: Date())]!)", numberOfLines: 2)
    private var chosenCategoriesCV = ChosenCategoriesCV()
    private var CHOSEN_CATEGORIES = BonusViewConstants.CHOSEN_CATEGORIES
    private var CHOSEN_CATEGORIES_LABEL = BonusViewConstants.CHOSEN_CATEGORIES_LABEL
    private var CHOOSE_CATEGTORIES_BUTTON = BonusViewConstants.BONUS_BUTTON(isYellow: true)
    private var CHOOSE_CATEGORIES = BonusViewConstants.BUTTON_LABEL(text: "Выбрать еще 2 категории", isBlack: true)

    private var townBonusView = BonusViewConstants.COMMON_VIEW()
    private var ON_ALL_CARDS_TOWN = BonusViewConstants.ON_CARDS()
    private var TOWN_CASHBACK = BonusViewConstants.CASHBACK_LABEL(text: "Кэшбэк в разделе Город")
    private var townBonusCV = BonusViewConstants.townBonusCV
    private var CHECK_ALL_OFFERS_BUTTON_TOWN = BonusViewConstants.BONUS_BUTTON()
    private var CHECK_ALL_OFFERS_TOWN = BonusViewConstants.BUTTON_LABEL()

    private var travelBonusView = BonusViewConstants.COMMON_VIEW()
    private var ON_ALL_CARDS_TRAVEL = BonusViewConstants.ON_CARDS()
    private var TRAVEL_CASHBACK = BonusViewConstants.CASHBACK_LABEL(text: "Кэшбэк за путешествия")
    private var travelBonucCV = BonusViewConstants.travelBonucCV
    private var CHECK_ALL_OFFERS_BUTTON_TRAVEL = BonusViewConstants.BONUS_BUTTON()
    private var CHECK_ALL_OFFERS_TRAVEL = BonusViewConstants.BUTTON_LABEL()
    
    private var platinumBonusTerm = BonusViewConstants.COMMON_VIEW()
    private var ON_PLATINUM = BonusViewConstants.ON_CARDS(text: "По платинум")
    private var ONE_PERCENT_CASHBACK = BonusViewConstants.ONE_PERCENT_CASHBACK

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if !inited {
            
            hideViews(views: cashbackCV, BOX_ICON, HOW_TO_GET_BONUSES, INVITE_FRIENDS, YOU_WILL_RECIEVE, tinkoffProImage, detailsLabel, ON_ALL_CARDS, PARTNERS_CASHBACK, partnerCashbackCV, ALL_OFFERS_BUTTON, ALL_OFFERS)
            
            self.cashbackCVPlaceholder.startSkeletonAnimation()
            self.inviteFriendsView.startSkeletonAnimation()
            self.partnerCashbackView.startSkeletonAnimation()
            
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                
                self.showViews(views: self.cashbackCV, self.BOX_ICON, self.HOW_TO_GET_BONUSES, self.INVITE_FRIENDS, self.YOU_WILL_RECIEVE, self.tinkoffProImage, self.detailsLabel, self.ON_ALL_CARDS, self.PARTNERS_CASHBACK, self.partnerCashbackCV, self.ALL_OFFERS_BUTTON, self.ALL_OFFERS)
                self.cashbackCVPlaceholder.isHidden = true
                
                self.cashbackCVPlaceholder.hideSkeleton()
                self.inviteFriendsView.hideSkeleton()
                self.partnerCashbackView.hideSkeleton()
                
                self.reloadInputViews()
                UIApplication.shared.endIgnoringInteractionEvents()
                inited.toggle()
            })
        }
        
        addSubview(cashbackCVPlaceholder)
        addSubview(cashbackCV)
        addSubview(HOW_TO_GET_BONUSES)
        addSubview(inviteFriendsView)
        addSubview(tinkoffProImage)
        addSubview(partnerCashbackView)
        addSubview(sharesBuyView)
        addSubview(partnerSubsView)
        addSubview(chosenCashbackView)
        addSubview(townBonusView)
        addSubview(travelBonusView)
        addSubview(platinumBonusTerm)

        inviteFriendsView.addSubview(INVITE_FRIENDS)
        inviteFriendsView.addSubview(YOU_WILL_RECIEVE)
        inviteFriendsView.addSubview(BOX_ICON)
        
        tinkoffProImage.addSubview(detailsButton)
        detailsButton.addSubview(detailsLabel)
        
        partnerCashbackView.addSubview(ON_ALL_CARDS)
        partnerCashbackView.addSubview(PARTNERS_CASHBACK)
        partnerCashbackView.addSubview(partnerCashbackCV)
        partnerCashbackView.addSubview(ALL_OFFERS_BUTTON)
        ALL_OFFERS_BUTTON.addSubview(ALL_OFFERS)
        
        sharesBuyView.addSubview(SHARES_BUY)
        sharesBuyView.addSubview(sharesBuyCV)
        sharesBuyView.addSubview(CHECK_ALL_OFFERS_BUTTON_SHARES)
        CHECK_ALL_OFFERS_BUTTON_SHARES.addSubview(CHECK_ALL_OFFERS_SHARES)
        
        partnerSubsView.addSubview(ON_ALL_CARDS_2)
        partnerSubsView.addSubview(PARTNERS_SUBS)
        partnerSubsView.addSubview(partnerSubsCV)
        partnerSubsView.addSubview(CHECK_ALL_OFFERS_BUTTON_SUBS)
        CHECK_ALL_OFFERS_BUTTON_SUBS.addSubview(CHECK_ALL_OFFERS_SUBS)
        
        chosenCashbackView.addSubview(ON_TINKOFF_BLACK)
        chosenCashbackView.addSubview(INCREASED_CASHBACK)
        chosenCashbackView.addSubview(chosenCategoriesCV)
        chosenCashbackView.addSubview(CHOSEN_CATEGORIES_LABEL)
        chosenCashbackView.addSubview(CHOOSE_CATEGTORIES_BUTTON)
        chosenCashbackView.addSubview(CHOOSE_CATEGORIES)
        
        townBonusView.addSubview(ON_ALL_CARDS_TOWN)
        townBonusView.addSubview(TOWN_CASHBACK)
        townBonusView.addSubview(townBonusCV)
        townBonusView.addSubview(CHECK_ALL_OFFERS_BUTTON_TOWN)
        townBonusView.addSubview(CHECK_ALL_OFFERS_TOWN)
        
        travelBonusView.addSubview(ON_ALL_CARDS_TRAVEL)
        travelBonusView.addSubview(TRAVEL_CASHBACK)
        travelBonusView.addSubview(travelBonucCV)
        travelBonusView.addSubview(CHECK_ALL_OFFERS_BUTTON_TRAVEL)
        travelBonusView.addSubview(CHECK_ALL_OFFERS_TRAVEL)
        
        platinumBonusTerm.addSubview(ON_PLATINUM)
        platinumBonusTerm.addSubview(ONE_PERCENT_CASHBACK)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyTamic(views: cashbackCVPlaceholder, cashbackCV, HOW_TO_GET_BONUSES, inviteFriendsView, tinkoffProImage, partnerCashbackView, INVITE_FRIENDS, YOU_WILL_RECIEVE, BOX_ICON, detailsButton, detailsLabel, ON_ALL_CARDS, PARTNERS_CASHBACK, partnerCashbackCV, ALL_OFFERS_BUTTON, ALL_OFFERS, sharesBuyView, SHARES_BUY, sharesBuyCV, CHECK_ALL_OFFERS_BUTTON_SHARES, CHECK_ALL_OFFERS_SHARES, partnerSubsView, ON_ALL_CARDS_2, PARTNERS_SUBS, partnerSubsCV, CHECK_ALL_OFFERS_BUTTON_SUBS, CHECK_ALL_OFFERS_SUBS, chosenCashbackView, ON_TINKOFF_BLACK, INCREASED_CASHBACK, chosenCategoriesCV, CHOSEN_CATEGORIES_LABEL, CHOOSE_CATEGTORIES_BUTTON, CHOOSE_CATEGORIES, townBonusView, travelBonusView, platinumBonusTerm, ON_ALL_CARDS_TOWN, TOWN_CASHBACK, townBonusCV, CHECK_ALL_OFFERS_BUTTON_TOWN, CHECK_ALL_OFFERS_TOWN, ON_ALL_CARDS_TRAVEL, TRAVEL_CASHBACK, travelBonucCV, CHECK_ALL_OFFERS_BUTTON_TRAVEL, CHECK_ALL_OFFERS_TRAVEL, ON_PLATINUM, ONE_PERCENT_CASHBACK)

        NSLayoutConstraint.activate([
            
            cashbackCVPlaceholder.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cashbackCVPlaceholder.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cashbackCVPlaceholder.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            cashbackCVPlaceholder.heightAnchor.constraint(equalToConstant: 170),
            
            cashbackCV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cashbackCV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cashbackCV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            cashbackCV.heightAnchor.constraint(equalToConstant: 170),
            
            HOW_TO_GET_BONUSES.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            HOW_TO_GET_BONUSES.topAnchor.constraint(equalTo: cashbackCV.bottomAnchor, constant: 20),
            
            inviteFriendsView.topAnchor.constraint(equalTo: HOW_TO_GET_BONUSES.bottomAnchor, constant: 15),
            inviteFriendsView.leadingAnchor.constraint(equalTo: cashbackCV.leadingAnchor),
            inviteFriendsView.trailingAnchor.constraint(equalTo: cashbackCV.trailingAnchor, constant: -5),
            inviteFriendsView.heightAnchor.constraint(equalToConstant: 100),
            
            BOX_ICON.topAnchor.constraint(equalTo: inviteFriendsView.topAnchor, constant: 10),
            BOX_ICON.trailingAnchor.constraint(equalTo: inviteFriendsView.trailingAnchor, constant: -15),
            BOX_ICON.widthAnchor.constraint(equalToConstant: 45),
            BOX_ICON.heightAnchor.constraint(equalToConstant: 45),
            
            INVITE_FRIENDS.topAnchor.constraint(equalTo: inviteFriendsView.topAnchor, constant: 15),
            INVITE_FRIENDS.leadingAnchor.constraint(equalTo: inviteFriendsView.leadingAnchor, constant: 20),
            
            YOU_WILL_RECIEVE.topAnchor.constraint(equalTo: INVITE_FRIENDS.bottomAnchor, constant: 10),
            YOU_WILL_RECIEVE.leadingAnchor.constraint(equalTo: INVITE_FRIENDS.leadingAnchor),
            YOU_WILL_RECIEVE.widthAnchor.constraint(equalToConstant: 155),
            
            tinkoffProImage.topAnchor.constraint(equalTo: inviteFriendsView.bottomAnchor, constant: 15),
            tinkoffProImage.leadingAnchor.constraint(equalTo: inviteFriendsView.leadingAnchor, constant: -15),
            tinkoffProImage.trailingAnchor.constraint(equalTo: inviteFriendsView.trailingAnchor, constant: 15),
            tinkoffProImage.heightAnchor.constraint(equalToConstant: 85),
            
            detailsButton.trailingAnchor.constraint(equalTo: tinkoffProImage.trailingAnchor, constant: -38),
            detailsButton.topAnchor.constraint(equalTo: tinkoffProImage.topAnchor, constant: 19),
            detailsButton.heightAnchor.constraint(equalToConstant: 31),
            detailsButton.widthAnchor.constraint(equalToConstant: 92),
            
            detailsLabel.centerXAnchor.constraint(equalTo: detailsButton.centerXAnchor),
            detailsLabel.centerYAnchor.constraint(equalTo: detailsButton.centerYAnchor),
            
            partnerCashbackView.topAnchor.constraint(equalTo: tinkoffProImage.bottomAnchor, constant: 15),
            partnerCashbackView.leadingAnchor.constraint(equalTo: inviteFriendsView.leadingAnchor),
            partnerCashbackView.trailingAnchor.constraint(equalTo: inviteFriendsView.trailingAnchor),
            partnerCashbackView.bottomAnchor.constraint(equalTo: ALL_OFFERS_BUTTON.bottomAnchor, constant: 20),

            ON_ALL_CARDS.topAnchor.constraint(equalTo: partnerCashbackView.topAnchor, constant: 20),
            ON_ALL_CARDS.leadingAnchor.constraint(equalTo: partnerCashbackView.leadingAnchor, constant: 15),
            
            PARTNERS_CASHBACK.topAnchor.constraint(equalTo: ON_ALL_CARDS.bottomAnchor, constant: 10),
            PARTNERS_CASHBACK.leadingAnchor.constraint(equalTo: ON_ALL_CARDS.leadingAnchor),
            
            partnerCashbackCV.topAnchor.constraint(equalTo: PARTNERS_CASHBACK.bottomAnchor, constant: 10),
            partnerCashbackCV.leadingAnchor.constraint(equalTo: PARTNERS_CASHBACK.leadingAnchor, constant: -5),
            partnerCashbackCV.trailingAnchor.constraint(equalTo: partnerCashbackView.trailingAnchor, constant: -10),
            partnerCashbackCV.heightAnchor.constraint(equalToConstant: 150),

            ALL_OFFERS_BUTTON.topAnchor.constraint(equalTo: partnerCashbackCV.bottomAnchor, constant: 10),
            ALL_OFFERS_BUTTON.leadingAnchor.constraint(equalTo: partnerCashbackCV.leadingAnchor),
            ALL_OFFERS_BUTTON.trailingAnchor.constraint(equalTo: partnerCashbackView.trailingAnchor, constant: -20),
            ALL_OFFERS_BUTTON.heightAnchor.constraint(equalToConstant: 50),
            
            ALL_OFFERS.centerXAnchor.constraint(equalTo: ALL_OFFERS_BUTTON.centerXAnchor),
            ALL_OFFERS.centerYAnchor.constraint(equalTo: ALL_OFFERS_BUTTON.centerYAnchor),
            
            sharesBuyView.topAnchor.constraint(equalTo: partnerCashbackView.bottomAnchor, constant: 15),
            sharesBuyView.leadingAnchor.constraint(equalTo: inviteFriendsView.leadingAnchor),
            sharesBuyView.trailingAnchor.constraint(equalTo: inviteFriendsView.trailingAnchor),
            sharesBuyView.bottomAnchor.constraint(equalTo: CHECK_ALL_OFFERS_BUTTON_SHARES.bottomAnchor, constant: 20),

            SHARES_BUY.topAnchor.constraint(equalTo: sharesBuyView.topAnchor, constant: 20),
            SHARES_BUY.leadingAnchor.constraint(equalTo: sharesBuyView.leadingAnchor, constant: 20),
            
            sharesBuyCV.topAnchor.constraint(equalTo: SHARES_BUY.bottomAnchor, constant: 5),
            sharesBuyCV.leadingAnchor.constraint(equalTo: SHARES_BUY.leadingAnchor, constant: -5),
            sharesBuyCV.trailingAnchor.constraint(equalTo: sharesBuyView.trailingAnchor, constant: -10),
            sharesBuyCV.heightAnchor.constraint(equalToConstant: 150),
            
            CHECK_ALL_OFFERS_BUTTON_SHARES.topAnchor.constraint(equalTo: sharesBuyCV.bottomAnchor, constant: 5),
            CHECK_ALL_OFFERS_BUTTON_SHARES.leadingAnchor.constraint(equalTo: SHARES_BUY.leadingAnchor),
            CHECK_ALL_OFFERS_BUTTON_SHARES.trailingAnchor.constraint(equalTo: sharesBuyView.trailingAnchor, constant: -20),
            CHECK_ALL_OFFERS_BUTTON_SHARES.heightAnchor.constraint(equalToConstant: 50),
            
            CHECK_ALL_OFFERS_SHARES.centerYAnchor.constraint(equalTo: CHECK_ALL_OFFERS_BUTTON_SHARES.centerYAnchor),
            CHECK_ALL_OFFERS_SHARES.centerXAnchor.constraint(equalTo: CHECK_ALL_OFFERS_BUTTON_SHARES.centerXAnchor),
            
            partnerSubsView.topAnchor.constraint(equalTo: sharesBuyView.bottomAnchor, constant: 15),
            partnerSubsView.leadingAnchor.constraint(equalTo: inviteFriendsView.leadingAnchor),
            partnerSubsView.trailingAnchor.constraint(equalTo: inviteFriendsView.trailingAnchor),
            partnerSubsView.bottomAnchor.constraint(equalTo: CHECK_ALL_OFFERS_BUTTON_SUBS.bottomAnchor, constant: 20),
            
            ON_ALL_CARDS_2.topAnchor.constraint(equalTo: partnerSubsView.topAnchor, constant: 20),
            ON_ALL_CARDS_2.leadingAnchor.constraint(equalTo: partnerSubsView.leadingAnchor, constant: 15),
            
            PARTNERS_SUBS.topAnchor.constraint(equalTo: ON_ALL_CARDS_2.bottomAnchor, constant: 10),
            PARTNERS_SUBS.leadingAnchor.constraint(equalTo: ON_ALL_CARDS_2.leadingAnchor),
            
            partnerSubsCV.topAnchor.constraint(equalTo: PARTNERS_SUBS.bottomAnchor, constant: 5),
            partnerSubsCV.leadingAnchor.constraint(equalTo: PARTNERS_SUBS.leadingAnchor, constant: -5),
            partnerSubsCV.trailingAnchor.constraint(equalTo: partnerSubsView.trailingAnchor, constant: -10),
            partnerSubsCV.heightAnchor.constraint(equalToConstant: 150),
            
            CHECK_ALL_OFFERS_BUTTON_SUBS.topAnchor.constraint(equalTo: partnerSubsCV.bottomAnchor, constant: 5),
            CHECK_ALL_OFFERS_BUTTON_SUBS.leadingAnchor.constraint(equalTo: PARTNERS_SUBS.leadingAnchor),
            CHECK_ALL_OFFERS_BUTTON_SUBS.trailingAnchor.constraint(equalTo: partnerSubsCV.trailingAnchor, constant: -10),
            CHECK_ALL_OFFERS_BUTTON_SUBS.heightAnchor.constraint(equalToConstant: 50),
            
            CHECK_ALL_OFFERS_SUBS.centerYAnchor.constraint(equalTo: CHECK_ALL_OFFERS_BUTTON_SUBS.centerYAnchor),
            CHECK_ALL_OFFERS_SUBS.centerXAnchor.constraint(equalTo: CHECK_ALL_OFFERS_BUTTON_SUBS.centerXAnchor),
            
            chosenCashbackView.topAnchor.constraint(equalTo: partnerSubsView.bottomAnchor, constant: 15),
            chosenCashbackView.leadingAnchor.constraint(equalTo: inviteFriendsView.leadingAnchor),
            chosenCashbackView.trailingAnchor.constraint(equalTo: inviteFriendsView.trailingAnchor),
            chosenCashbackView.bottomAnchor.constraint(equalTo: CHOOSE_CATEGTORIES_BUTTON.bottomAnchor, constant: 20),
            
            ON_TINKOFF_BLACK.topAnchor.constraint(equalTo: chosenCashbackView.topAnchor, constant: 20),
            ON_TINKOFF_BLACK.leadingAnchor.constraint(equalTo: chosenCashbackView.leadingAnchor, constant: 15),
            
            INCREASED_CASHBACK.topAnchor.constraint(equalTo: ON_TINKOFF_BLACK.bottomAnchor, constant: 10),
            INCREASED_CASHBACK.leadingAnchor.constraint(equalTo: ON_TINKOFF_BLACK.leadingAnchor),
            INCREASED_CASHBACK.trailingAnchor.constraint(equalTo: chosenCashbackView.trailingAnchor, constant: -40),
            
            chosenCategoriesCV.topAnchor.constraint(equalTo: INCREASED_CASHBACK.bottomAnchor, constant: 5),
            chosenCategoriesCV.leadingAnchor.constraint(equalTo: INCREASED_CASHBACK.leadingAnchor, constant: -5),
            chosenCategoriesCV.trailingAnchor.constraint(equalTo: chosenCashbackView.trailingAnchor, constant: -280),
            chosenCategoriesCV.heightAnchor.constraint(equalToConstant: 50),
            
            CHOSEN_CATEGORIES_LABEL.centerYAnchor.constraint(equalTo: chosenCategoriesCV.centerYAnchor),
            CHOSEN_CATEGORIES_LABEL.leadingAnchor.constraint(equalTo: chosenCategoriesCV.trailingAnchor, constant: 5),
            
            CHOOSE_CATEGTORIES_BUTTON.topAnchor.constraint(equalTo: chosenCategoriesCV.bottomAnchor, constant: 15),
            CHOOSE_CATEGTORIES_BUTTON.leadingAnchor.constraint(equalTo: INCREASED_CASHBACK.leadingAnchor),
            CHOOSE_CATEGTORIES_BUTTON.trailingAnchor.constraint(equalTo: chosenCashbackView.trailingAnchor, constant: -20),
            CHOOSE_CATEGTORIES_BUTTON.heightAnchor.constraint(equalToConstant: 50),
            
            CHOOSE_CATEGORIES.centerYAnchor.constraint(equalTo: CHOOSE_CATEGTORIES_BUTTON.centerYAnchor),
            CHOOSE_CATEGORIES.centerXAnchor.constraint(equalTo: CHOOSE_CATEGTORIES_BUTTON.centerXAnchor),
            
            townBonusView.topAnchor.constraint(equalTo: chosenCashbackView.bottomAnchor, constant: 15),
            townBonusView.leadingAnchor.constraint(equalTo: inviteFriendsView.leadingAnchor),
            townBonusView.trailingAnchor.constraint(equalTo: inviteFriendsView.trailingAnchor),
            townBonusView.bottomAnchor.constraint(equalTo: CHECK_ALL_OFFERS_BUTTON_TOWN.bottomAnchor, constant: 20),
            
            ON_ALL_CARDS_TOWN.topAnchor.constraint(equalTo: townBonusView.topAnchor, constant: 20),
            ON_ALL_CARDS_TOWN.leadingAnchor.constraint(equalTo: townBonusView.leadingAnchor, constant: 20),
            
            TOWN_CASHBACK.topAnchor.constraint(equalTo: ON_ALL_CARDS_TOWN.bottomAnchor, constant: 10),
            TOWN_CASHBACK.leadingAnchor.constraint(equalTo: ON_ALL_CARDS_TOWN.leadingAnchor),
            
            townBonusCV.topAnchor.constraint(equalTo: TOWN_CASHBACK.bottomAnchor, constant: 5),
            townBonusCV.leadingAnchor.constraint(equalTo: TOWN_CASHBACK.leadingAnchor, constant: -5),
            townBonusCV.trailingAnchor.constraint(equalTo: townBonusView.trailingAnchor, constant: -10),
            townBonusCV.heightAnchor.constraint(equalToConstant: 150),
            
            CHECK_ALL_OFFERS_BUTTON_TOWN.topAnchor.constraint(equalTo: townBonusCV.bottomAnchor, constant: 5),
            CHECK_ALL_OFFERS_BUTTON_TOWN.leadingAnchor.constraint(equalTo: TOWN_CASHBACK.leadingAnchor),
            CHECK_ALL_OFFERS_BUTTON_TOWN.trailingAnchor.constraint(equalTo: townBonusCV.trailingAnchor, constant: -10),
            CHECK_ALL_OFFERS_BUTTON_TOWN.heightAnchor.constraint(equalToConstant: 50),
            
            CHECK_ALL_OFFERS_TOWN.centerYAnchor.constraint(equalTo: CHECK_ALL_OFFERS_BUTTON_TOWN.centerYAnchor),
            CHECK_ALL_OFFERS_TOWN.centerXAnchor.constraint(equalTo: CHECK_ALL_OFFERS_BUTTON_TOWN.centerXAnchor),
            
            travelBonusView.topAnchor.constraint(equalTo: townBonusView.bottomAnchor, constant: 15),
            travelBonusView.leadingAnchor.constraint(equalTo: inviteFriendsView.leadingAnchor),
            travelBonusView.trailingAnchor.constraint(equalTo: inviteFriendsView.trailingAnchor),
            travelBonusView.bottomAnchor.constraint(equalTo: CHECK_ALL_OFFERS_BUTTON_TRAVEL.bottomAnchor, constant: 20),
            
            ON_ALL_CARDS_TRAVEL.topAnchor.constraint(equalTo: travelBonusView.topAnchor, constant: 20),
            ON_ALL_CARDS_TRAVEL.leadingAnchor.constraint(equalTo: travelBonusView.leadingAnchor, constant: 20),
            
            TRAVEL_CASHBACK.topAnchor.constraint(equalTo: ON_ALL_CARDS_TRAVEL.bottomAnchor, constant: 10),
            TRAVEL_CASHBACK.leadingAnchor.constraint(equalTo: ON_ALL_CARDS_TRAVEL.leadingAnchor),
            
            travelBonucCV.topAnchor.constraint(equalTo: TRAVEL_CASHBACK.bottomAnchor, constant: 5),
            travelBonucCV.leadingAnchor.constraint(equalTo: TRAVEL_CASHBACK.leadingAnchor, constant: -5),
            travelBonucCV.trailingAnchor.constraint(equalTo: travelBonusView.trailingAnchor, constant: -10),
            travelBonucCV.heightAnchor.constraint(equalToConstant: 150),
            
            CHECK_ALL_OFFERS_BUTTON_TRAVEL.topAnchor.constraint(equalTo: travelBonucCV.bottomAnchor, constant: 5),
            CHECK_ALL_OFFERS_BUTTON_TRAVEL.leadingAnchor.constraint(equalTo: TRAVEL_CASHBACK.leadingAnchor),
            CHECK_ALL_OFFERS_BUTTON_TRAVEL.trailingAnchor.constraint(equalTo: travelBonucCV.trailingAnchor, constant: -10),
            CHECK_ALL_OFFERS_BUTTON_TRAVEL.heightAnchor.constraint(equalToConstant: 50),
            
            CHECK_ALL_OFFERS_TRAVEL.centerYAnchor.constraint(equalTo: CHECK_ALL_OFFERS_BUTTON_TRAVEL.centerYAnchor),
            CHECK_ALL_OFFERS_TRAVEL.centerXAnchor.constraint(equalTo: CHECK_ALL_OFFERS_BUTTON_TRAVEL.centerXAnchor),
            
            platinumBonusTerm.topAnchor.constraint(equalTo: travelBonusView.bottomAnchor, constant: 15),
            platinumBonusTerm.leadingAnchor.constraint(equalTo: inviteFriendsView.leadingAnchor),
            platinumBonusTerm.trailingAnchor.constraint(equalTo: inviteFriendsView.trailingAnchor),
            platinumBonusTerm.bottomAnchor.constraint(equalTo: ONE_PERCENT_CASHBACK.bottomAnchor, constant: 20),
            
            ON_PLATINUM.topAnchor.constraint(equalTo: platinumBonusTerm.topAnchor, constant: 20),
            ON_PLATINUM.leadingAnchor.constraint(equalTo: platinumBonusTerm.leadingAnchor, constant: 20),
            
            ONE_PERCENT_CASHBACK.topAnchor.constraint(equalTo: ON_PLATINUM.bottomAnchor, constant: 5),
            ONE_PERCENT_CASHBACK.leadingAnchor.constraint(equalTo: ON_PLATINUM.leadingAnchor),
        ])
    }
}
