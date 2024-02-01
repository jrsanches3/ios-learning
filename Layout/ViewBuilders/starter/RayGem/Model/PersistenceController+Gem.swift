/// Copyright (c) 2021 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import CoreData

extension PersistenceController {
  func createInitialGems(context: NSManagedObjectContext) {
    createFirstGems(context: context)
    createSecondGems(context: context)
    createThirdGems(context: context)
    createDiamonds(context: context)
  }

  func createFirstGems(context: NSManagedObjectContext) {
    let rose = Gem(context: context)
    rose.name = "Rose Quartz"
    rose.info = "A pinkish quartz, found in many shapes and sizes. Rose Quartz was once the leader of the Crystal Gems."
    rose.imageName = "rose"
    rose.mainColor = "rose"
    rose.crystalSystem = "Hexagonal crystal system"
    rose.formula = "SiO₂"
    rose.hardness = "7"
    rose.transparency = "Translucent, Transparent"
    rose.timestamp = Date()

    let lapis = Gem(context: context)
    lapis.name = "Lapis Lazuli"
    lapis.info = """
    Lapis lazuli is a deep-blue rock used to create semiprecious stones and artifacts.
    Lapis Lazuli once terraformed planets for Homeworld.
    """
    lapis.imageName = "lapis"
    lapis.mainColor = "blue"
    lapis.crystalSystem = "Cubic crystal system"
    lapis.formula = "(Na,Ca)₈Al₆Si₆O₂₄ (S,SO)₄"
    lapis.hardness = "5 – 5.5"
    lapis.transparency = "Opaque"
    lapis.timestamp = Date()

    let ruby = Gem(context: context)
    ruby.name = "Ruby"
    ruby.info = """
    Ruby is a blood red gemstone.
    Rubies were used in armor and placed under the foundation of buildings to ensure good fortune.
    They are great warriors but usually hotheaded and easily distracted.
    """
    ruby.imageName = "ruby"
    ruby.mainColor = "ruby"
    ruby.crystalSystem = "Hexagonal crystal system"
    ruby.formula = "Al₂O₃"
    ruby.hardness = "9"
    ruby.transparency = "Opaque, Transparent"
    ruby.timestamp = Date()

    let sapphire = Gem(context: context)
    sapphire.name = "Sapphire"
    sapphire.info = """
    Sapphire is a blue precious gemstone not typically used in costume jewelry.
    Sapphire has the power to see branches of the future.
    """
    sapphire.imageName = "sapphire"
    sapphire.mainColor = "blue"
    sapphire.crystalSystem = "Hexagonal crystal system"
    sapphire.formula = "Al₂O₃"
    sapphire.hardness = "9"
    sapphire.transparency = "Opaque, Transparent"
    sapphire.timestamp = Date()
  }

  func createSecondGems(context: NSManagedObjectContext) {
    let amethyst = Gem(context: context)
    amethyst.name = "Amethyst"
    amethyst.info = """
    Amethyst is a violet variety of quartz.
    Considered semiprecious, it is often used in jewelry.
    The name derives from the Greek a-methustos, not drunk.
    Ancient Greeks believed this gem prevented insobriety and often carved wine goblets from it.
    Amethysts are big strong warriors, but the little ones are even stronger.
    """
    amethyst.imageName = "amethyst"
    amethyst.mainColor = "purple"
    amethyst.crystalSystem = "Hexagonal crystal system"
    amethyst.formula = "SiO₂"
    amethyst.hardness = "7"
    amethyst.transparency = "Translucent, Transparent"
    amethyst.timestamp = Date()

    let pearl = Gem(context: context)
    pearl.name = "Pearl"
    pearl.info = """
    Pearl is a hard, usually white- or beige-colored substance, produced inside an oyster.
    Pearls are ground into cosmetics and sewn onto clothing.
    They were created to serve, due to their caring nature, but make no mistake: once free, Pearls are loyal leaders.
    """
    pearl.imageName = "pearl"
    pearl.mainColor = "beige"
    pearl.crystalSystem = "Hexagonal crystal system"
    pearl.formula = "Calcium carbonate, CaCO3 Conchiolin"
    pearl.hardness = "2.5 – 4.5"
    pearl.transparency = "Opaque"
    pearl.timestamp = Date()

    let peridot = Gem(context: context)
    peridot.name = "Peridot"
    peridot.info = """
    Peridot is a light green gem. In the Middle Ages, peridots were believed to have healing powers.
    Peridots may seem rather cold, but once they get to know you, they get really attached.
    They are very smart and can handle technology very well.
    """
    peridot.imageName = "peridot"
    peridot.mainColor = "green"
    peridot.crystalSystem = "Orthorhombic crystal system"
    peridot.formula = "(Mg,Fe)₂SiO₄"
    peridot.hardness = "6.5 – 7"
    peridot.transparency = "Opaque"
    peridot.timestamp = Date()

    let bismuth = Gem(context: context)
    bismuth.name = "Bismuth"
    bismuth.info = """
    Bismuth is a gemstone with a metallic shine.
    It is element 83 on the periodic table.
    Bismuths excel at building structures and forging weapons.
    """
    bismuth.imageName = "bismuth"
    bismuth.mainColor = "metal"
    bismuth.crystalSystem = "n/a"
    bismuth.formula = "(Mg,Fe)₂SiO₄"
    bismuth.hardness = "2.25"
    bismuth.transparency = "n/a"
    bismuth.timestamp = Date()
  }

  func createThirdGems(context: NSManagedObjectContext) {
    let aquamarine = Gem(context: context)
    aquamarine.name = "Aquamarine"
    aquamarine.info = """
    Aquamarine is a pale-blue kind of gem. It never quite understood what it was to have companions.
    Only when it met another Ruby it understood that together they were stronger.
    """
    aquamarine.imageName = "aquamarine"
    aquamarine.mainColor = "blue"
    aquamarine.crystalSystem = "Hexagonal crystal system"
    aquamarine.formula = "Be3Al2"
    aquamarine.hardness = "7.5 – 8"
    aquamarine.transparency = "Translucent, Transparent"
    aquamarine.timestamp = Date()

    let jasper = Gem(context: context)
    jasper.name = "Jasper"
    jasper.info = """
    Jasper is an aggregate of many different mineral and quartz.
    It is very strong, compared to other gems, and can be very tough and cold. But it is only looking for a purpose.
    """
    jasper.imageName = "jasper"
    jasper.mainColor = "jasper"
    jasper.crystalSystem = "Hexagonal crystal system"
    jasper.formula = "SiO₂"
    jasper.hardness = "6.5 – 7"
    jasper.transparency = "Opaque"
    jasper.timestamp = Date()

    let larimar = Gem(context: context)
    larimar.name = "Larimar"
    larimar.info = """
    Larimar is a rare blue gem found only in the Dominican Republic in the Caribbean.
    She's very kind-hearted and always tries to make people happy. She's always looking for new things to learn and do.
    """
    larimar.imageName = "larimar"
    larimar.mainColor = "blue"
    larimar.crystalSystem = "Triclinic crystal system"
    larimar.formula = "NaCa2Si3O8(OH)"
    larimar.hardness = "4.5 – 5"
    larimar.transparency = "Opaque, Translucent"
    larimar.timestamp = Date()

    let obsidian = Gem(context: context)
    obsidian.name = "Obsidian"
    obsidian.info = """
    Obsidian is a volcanic glass formed when lava is quickly cooled.
    A friendly and easily panicked gem. She was part of the crystal gems but even after the war she kept her job.
    """
    obsidian.imageName = "obsidian"
    obsidian.mainColor = "dark"
    obsidian.crystalSystem = "-"
    obsidian.formula = "SiO2"
    obsidian.hardness = "5 - 5.5"
    obsidian.transparency = "Opaque, Translucent"
    obsidian.timestamp = Date()
  }

  func createDiamonds(context: NSManagedObjectContext) {
    let blueDiamond = Gem(context: context)
    blueDiamond.name = "Blue Diamond"
    blueDiamond.info = """
    Blue Diamond is a blueish kind of diamond. She always looks a bit tired and sad.
    After the war, her powers evolved from making gems feel her sadness to making gems feel joy.
    She helps other gems cure their traumas.
    """
    blueDiamond.imageName = "blue-diamond"
    blueDiamond.mainColor = "blue"
    blueDiamond.crystalSystem = "Cubic system"
    blueDiamond.formula = "C B (trace)"
    blueDiamond.hardness = "10"
    blueDiamond.transparency = "Translucent, Transparent"
    blueDiamond.timestamp = Date()

    let yellowDiamond = Gem(context: context)
    yellowDiamond.name = "Yellow Diamond"
    yellowDiamond.info = """
    Yellow Diamond is a yellowish kind of diamond. Yellow looks very formal and serious, as well as very short tempered.
    After the war, she helps gems that were experimented on to recover their original body.
    """
    yellowDiamond.imageName = "yellow-diamond"
    yellowDiamond.mainColor = "yellow"
    yellowDiamond.crystalSystem = "Cubic system"
    yellowDiamond.formula = "C B (trace)"
    yellowDiamond.hardness = "10"
    yellowDiamond.transparency = "Translucent, Transparent"
    yellowDiamond.timestamp = Date()

    let whiteDiamond = Gem(context: context)
    whiteDiamond.name = "White Diamond"
    whiteDiamond.info = """
    White Diamond is a whiteish/clear kind of diamond.
    White has always looked out for her sisters, perhaps even a little too much.
    She has a very friendly aura that hides anger and contempt.
    After the war, she helps gems by letting them talk through her and understand their needs.
    """
    whiteDiamond.imageName = "white-diamond"
    whiteDiamond.mainColor = "white"
    whiteDiamond.crystalSystem = "Cubic system"
    whiteDiamond.formula = "C"
    whiteDiamond.hardness = "10"
    whiteDiamond.transparency = "Translucent, Transparent"
    whiteDiamond.timestamp = Date()

    let pinkDiamond = Gem(context: context)
    pinkDiamond.name = "Pink Diamond"
    pinkDiamond.info = """
    Pink Diamond is a pinkish kind of diamond.
    Pink is the youngest and most playful of the diamonds. It is always making some joke or charade.
    She feels like her older sisters don't take her serious and wants to prover her value to them.
    She ends up meeting other gems and people and that changes her.
    Even tough she didn't think about the pain she might cause, she ended up doing the biggest sacrifice to create life.
    """
    pinkDiamond.imageName = "pink-diamond"
    pinkDiamond.mainColor = "pink"
    pinkDiamond.crystalSystem = "Cubic system"
    pinkDiamond.formula = "C"
    pinkDiamond.hardness = "10"
    pinkDiamond.transparency = "Translucent, Transparent"
    pinkDiamond.timestamp = Date()
  }
}
