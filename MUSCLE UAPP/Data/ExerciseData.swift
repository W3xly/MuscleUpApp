//
//  ExerciseData.swift
//  Muscle UApp
//
//  Created by Johana Šlechtová on 06/02/2020.
//  Copyright © 2020 Jan Podmolík. All rights reserved.
//

import SwiftUI

let exerciseData: [Exercise] = [
    Exercise(
        title: "Vysoký Přítah",
        stepByStep: ["Začni s klasickým přítahem a se vzrůstající silou tahej hrazdu co nejblíže k pasu.", "Počet opakování nehraje roli - technika na prvním místě.", "Tělo je zpevněné v průběhu celého pohybu.", "Ze začátku si neboj dopomoct dynamikou spodní části těla."],
        image: "pullUp",
        gif: "pullup.gif",
        parts: ["backIcon", "forearmIcon"],
        reps: [1,2,3,4,5]),
    Exercise(
        title: "Horizontální Přítah",
        stepByStep: ["Experimentuj s výškou i šířkou úchopu.", "Tělo je zpevněné v průběhu celého pohybu.", "Tyč táhni k hrudníku - ne ke krku.", "Vyzkoušej setrvat pár sekund ve vrchni fázi pohybu", "Zařaď cvik do multisérie s dalším cvikem."],
        image: "australian",
        gif: "australian.gif",
        parts: ["backIcon", "forearmIcon"],
        reps: [5,8,10,12]),
    Exercise(
        title: "Dynamický Přítah",
        stepByStep: ["Úchop na šířku ramen. Pohyb začni menším zhoupnutím.", "Nenech si utéct lokty vpřed, táhni je vždy dolů až k pasu.", "Zapoj celý střed těla.", "Pracuj na souhře horních a dolních končetin.", "Využij techniku explosivních přítahů nohou", "Vždy radši 2-3 vysoké, než spoustu nízkých."],
        image: "australianDynamic",
        gif: "dynamicPullUp.gif",
        parts: ["backIcon", "forearmIcon", "absIcon"],
        reps: [2,3,4,5,6]),
    Exercise(
    title: "Negativní MuscleUp",
    stepByStep: ["Neboj se naklonit nad hrazdu a opřít hrudník o tyč.", "Lokty si drž u těla soustřeď se na pevnost úchopu.", "Při přechodu do spodní fáze se soustřed na plynulou vnější rotaci ramen a pomalý přechod dolů.", "Stejně kontroluj i pohyb pod týčí.", "Mezi jednotlivými opakováními si klidně dej delší pauzu."],
    image: "negative",
    gif: "negative.gif",
    parts: ["chestIcon", "backIcon", "forearmIcon", "tricepsIcon"],
    reps: [1,2,3,4]),
    Exercise(
    title: "Dip na Přední Tyči",
    stepByStep: ["Úchop na šířku ramen.", "Před opakováním pozvedni boky a lehce se nakloň nad tyč", "Břicho je zpevněné, nohy jsou zpevněné a u sebe", "Lokty se snaž vždy tlačit spíše k tělu, ať nedochází k velké vnitřní rotaci ramen.", "Dělej pohyb vždy v celém rozsahu, nahoře zamkni lokty.",],
    image: "dip",
    gif: "dip.gif",
    parts: ["chestIcon", "tricepsIcon"],
    reps: [3,5,8,10,12]),
    Exercise(
    title: "Dynamický Horizontální Přítah",
    stepByStep: ["Pečlivě vyber dostatečně vysokou tyč - vyšší je lepší pro začátečníky.", "Použij odraz nohou dostatečně tak, ať dostatneš ramena nad úroveň tyče.", "Udržuj dostatečný prostor mezi hrudníkem a tyčí.", "Ve vrchní pozici se pokus o silnou kontrakci křídel.", "Jdi si pro menší počet kvalitních opakování."],
    image: "australianDynamic",
    gif: "dynamicAustralian.gif",
    parts: ["backIcon", "forearmIcon"],
    reps: [2,3,4,5,6,8,10]),
    Exercise(
    title: "Explosivní přítahy nohou",
    stepByStep: ["Souhra rukou a nohou je u tohoto pohybu extrémně důležitá", "Neprohýbej bedra a nekopej nohama za sebe.", "Břicho drž celou dobu v kontrakci.", "Nohy se vždy snaž dostat do roviny se zemí - 90°.", "Silné břicho ti pomůže přenést energie ze spodní poloviny těla.", "Najdi v pohybu rytmus."],
    image: "abs",
    gif: "abs.gif",
    parts: ["absIcon", "forearmIcon"],
    reps: [3,4,5,6,8,10]),
    Exercise(title: "Muscle up z výskoku",
    stepByStep: ["Vždy vol takovou výšku hrazdy, ať děláš cvik bez větších obtíží.","Snaž se výskok přizpůsobit aktuální síle a dělej cvik s co největším zapojením vrchní části těla.", "Jdi si pro více opakování, 6 - 15", "Po výskoku dostaň hrudník co nejrychleji nad hrazdu a předkloň se do spodní fáze dipu na přední tyči.","Po ukončení cviku se soustřeď i na negativní fázi."],
    image: "jump",
    gif: "jumpMuscleUp.gif",
    parts: ["backIcon", "chestIcon", "tricepsIcon"],
    reps: [2,3,4,5,8,10,12,15]),
    Exercise(title: "Muscle up s dopomocí",
    stepByStep: ["Pověs se na hrazdu a pokrče kolena za sebe.",
    "Opři nárty o kamarádovy ruce.",
    "Tvůj parťák tě nijak netlačí nahoru!",
    "Velikost pomoci si určuješ sám, podle síly kterou tlačíš proti rukám.",
    "Technika je podobná spíše silovému muscle upu, protože nedochází ke zhoupnutí."],
    image: "withHelp",
    gif: "withHelp.gif",
    parts: ["backIcon", "chestIcon", "tricepsIcon"],
    reps: [2,3,4,5])
]
