module WeaponTranslationHelper
    def translate_weapon(weapon)
        {
            famas: "Famas",
            g3sg1: "Gun"
        }[weapon.to_sym]
    end
end
