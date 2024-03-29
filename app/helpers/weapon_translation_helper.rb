module WeaponTranslationHelper
  def translate_weapon(weapon)
    {
      ak47: "Ak47",
      aug: "Aug",
      awp: "Awp",
      axe: "Axe",
      bizon: "Bizon",
      c4: "C4",
      cz75a: "Cz75a",
      deagle: "Desert Eagle",
      decoy: "Decoy Grenade",
      elite: "Dual Berettas",
      famas: "Famas",
      fists: "Fists",
      fiveseven: "Five Seven",
      flashbang: "Flashbang",
      g3sg1: "G3sg1",
      galilar: "Galil Ar",
      glock: "Glock-18",
      hammer: "Hammer",
      hkp2000: "Hkp2000",
      incgrenade: "Incendiary Grenade",
      knifegg: "Knife",
      m249: "M249",
      m4a1: "M4a1",
      m4a1_silencer: "M4a1-Silencer",
      mac10: "Mac10",
      mag7: "MAG-7",
      molotov: "Molotov",
      mp5sd: "Mp5-SD",
      mp7: "MP7",
      mp9: "MP9",
      negev: "Negev",
      nova: "Nova",
      p250: "P250",
      p90: "P90",
      revolver: "R8 Revolver",
      breachcharge: "Breach Charge",
      bumpmine: "Bump Mine",
      sawedoff: "Sawed-Off",
      scar20: "SCAR-20",
      sg556: "SG 553",
      smokegrenade: "Smoke Grenade",
      snowball: "Snowball",
      spanner: "Spanner",
      ssg08: "SSG 08",
      tagrenade: "Tactical Awareness Grenade",
      taser: "Taser Zeus",
      tec9: "Tec-9",
      ump45: "UMP-45",
      usp_silencer: "USP-S",
      xm1014: "XM1014",
      zone_repulsor: "Zone Repulsor"
    }[weapon.to_sym]
  end
end
