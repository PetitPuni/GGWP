// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ClipboardController from "./clipboard_controller"
application.register("clipboard", ClipboardController)

import FlatpickrController from "./flatpickr_controller"
application.register("flatpickr", FlatpickrController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import LeagueSubscriptionController from "./league_subscription_controller"
application.register("league-subscription", LeagueSubscriptionController)

import RankingSubscriptionController from "./ranking_subscription_controller"
application.register("ranking-subscription", RankingSubscriptionController)

import ShareController from "./share_controller"
application.register("share", ShareController)

import TimerController from "./timer_controller"
application.register("timer", TimerController)

import TypedController from "./typed_controller"
application.register("typed", TypedController)
