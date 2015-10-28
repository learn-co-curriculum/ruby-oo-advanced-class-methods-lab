---
tags:
languages:
resources:
---
# Ruby Advanced Class Methods Lab

Build a song model that provides an api for crud songs

explain crud

they have to build

song names can be in format "Song Name  - Artist"

Song#name
Song#save
Song#destroy (find instance in all by object equality and remove from array)
Songs are saved on initialize
Song.all

Song.find_by_name
Song.alphabetical # return all sorted by song name.

Song.create_by_name # initialize with name
Song.find_or_create_by_name # composed method of find_by_name or create_by_name
Song.create_by_filename # takes format of artist - song name.mp3 and normalizes input to create_by_name correctly

Song.destroy_all # clear @@all
Song.destroy_duplicates # use find_by name and destroy to remove duplicate song instances that have the same name.
