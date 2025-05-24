SMODS.Sound({key = "balatrito", path = "balatrito.ogg",})

SMODS.Atlas{
    key = 'BalatroBalatrez',
    path = 'BalatroBalatrez.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'balatro_balatrez',
    loc_txt = {
        name = 'Balatro Balatrez',
        text = {
            "This Joker gains {X:mult,C:white} X#2# {} Mult",
            "y {X:chips,C:white} X#4#{} chips when", 
            "a {C:attention}card{} is scored",
            "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult & {X:chips,C:white} X#3#{}{C:inactive}) Chips)",
        },
    },
    atlas = 'BalatroBalatrez',
    pos = {x = 0, y = 0},
    soul_pos = { x = 0, y = 1}, 
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,

    config = { 
        extra = {
            x_mult = 1, 
            x_mult_gain = 0.05,
            x_chips = 1, 
            x_chips_gain = 0.05
        } 
    }, 

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.x_mult,
                center.ability.extra.x_mult_gain,
                center.ability.extra.x_chips,
                center.ability.extra.x_chips_gain
            }
        }
    end,


    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_gain
                card.ability.extra.x_chips = card.ability.extra.x_chips + card.ability.extra.x_chips_gain

                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.MULT,
                    message_card = card
                }
        end

        if context.joker_main then
                return {
                    xmult = card.ability.extra.x_mult,
                    xchips = card.ability.extra.x_chips,
                    message = "Sale Balatrito?",
                    colour = G.C.MULT,
                    message_card = card,
                    sound = "balatrez_balatrito"
                }
                end
        end
}
