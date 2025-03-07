
Engines = {}
if not IsDuplicityVersion() and GetResourceState('ox_inventory') == 'started' and Config.Ox_Inventory then
	function onEnter(self)
		lib.showTextUI('[E] - Buy Engines', {
			position = "right-center",
			icon = 'hand',
			style = {
				borderRadius = 0,
				backgroundColor = '#48BB78',
				color = 'white'
			}
		})
	end

	function onExit(self)
		lib.hideTextUI()
	end

	function inside(self)
		if IsControlJustPressed(0,38) then
			BuyEngines()
		end
	end

	local sphere = lib.zones.sphere({
		coords = vec3(845.97,-1067.82,28.035890),
		radius = 1,
		debug = false,
		inside = inside,
		onEnter = onEnter,
		onExit = onExit
	})
	BuyEngines = function()
		local options = {}
		local secondary = {}
		local brands = {}
		for k,v in pairs(Engines) do
			if v.brand == nil then v.brand = 'custom' end
			if v.name == nil then v.name = v.handlingName end
			if not brands[v.brand] then
				brands[v.brand] = true
				table.insert(options,{
					title = v.brand,
					menu = 'brand_'..v.brand,
					arrow = true,
					description = 'Select '..v.brand,
				})
			end
			if secondary[v.brand] == nil then secondary[v.brand] = {} end
			table.insert(secondary[v.brand],{
				title = v.name..' Engine',
				onSelect = function(args)
					TriggerServerEvent('buyengine',k)
				end,
				description = 'Buy '..v.name..' price:'..v.price,
			})
		end
		for k,v in pairs(Engines) do
			if v.brand == nil then v.brand = 'custom' end
			if v.name == nil then v.name = v.handlingName end
			lib.registerContext({
				id = 'brand_'..v.brand,
				title = v.brand..' Engine',
				onExit = function()
					print('Hello there')
				end,
				menu = 'buyengine',
				options = secondary[v.brand]
			})
		end
		
		lib.registerContext({
			id = 'buyengine',
			title = 'Buy Engine',
			onExit = function()
				print('Hello there')
			end,
			options = options
		})
		lib.showContext('buyengine')
	end
	local blip = AddBlipForCoord(845.97,-1067.82,28.035890)
	SetBlipSprite(blip, 642)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.8)
	SetBlipColour(blip, 3)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName('Engine Shop')
	EndTextCommandSetBlipName(blip)
end
Engines = { -- https://github.com/qbcore-framework/qb-core/blob/main/shared/vehicles.lua
	--- Compacts
	['asbo'] = {
		['name'] = 'Asbo',
		['brand'] = 'Maxwell',
		['model'] = 'asbo',
		['price'] = 4000,
		['category'] = 'compacts',
		['hash'] = `asbo`,
		
	},
	['blista'] = {
		['name'] = 'Blista',
		['brand'] = 'Dinka',
		['model'] = 'blista',
		['price'] = 13000,
		['category'] = 'compacts',
		['hash'] = `blista`,
		
	},
	['brioso'] = {
		['name'] = 'Brioso R/A',
		['brand'] = 'Grotti',
		['model'] = 'brioso',
		['price'] = 20000,
		['category'] = 'compacts',
		['hash'] = `brioso`,
		
	},
	['club'] = {
		['name'] = 'Club',
		['brand'] = 'BF',
		['model'] = 'club',
		['price'] = 8000,
		['category'] = 'compacts',
		['hash'] = `club`,
		
	},
	['dilettante'] = {
		['name'] = 'Dilettante',
		['brand'] = 'Karin',
		['model'] = 'dilettante',
		['price'] = 9000,
		['category'] = 'compacts',
		['hash'] = `dilettante`,
		
	},
	['dilettante2'] = {
		['name'] = 'Dilettante Patrol',
		['brand'] = 'Karin',
		['model'] = 'dilettante2',
		['price'] = 12000,
		['category'] = 'compacts',
		['hash'] = `dilettante2`,
		
	},
	['kanjo'] = {
		['name'] = 'Blista Kanjo',
		['brand'] = 'Dinka',
		['model'] = 'kanjo',
		['price'] = 12000,
		['category'] = 'compacts',
		['hash'] = `kanjo`,
		
	},
	['issi2'] = {
		['name'] = 'Issi',
		['brand'] = 'Weeny',
		['model'] = 'issi2',
		['price'] = 7000,
		['category'] = 'compacts',
		['hash'] = `issi2`,
		
	},
	['issi3'] = {
		['name'] = 'Issi Classic',
		['brand'] = 'Weeny',
		['model'] = 'issi3',
		['price'] = 5000,
		['category'] = 'compacts',
		['hash'] = `issi3`,
		
	},
	['issi4'] = {							--DLC
		['name'] = 'Issi Arena',
		['brand'] = 'Weeny',
		['model'] = 'issi4',
		['price'] = 80000,
		['category'] = 'compacts',
		['hash'] = `issi4`,
		
	},
	['issi5'] = {							--DLC
		['name'] = 'Issi Arena',
		['brand'] = 'Weeny',
		['model'] = 'issi5',
		['price'] = 80000,
		['category'] = 'compacts',
		['hash'] = `issi5`,
		
	},
	['issi6'] = {							--DLC
		['name'] = 'Issi Arena',
		['brand'] = 'Weeny',
		['model'] = 'issi6',
		['price'] = 80000,
		['category'] = 'compacts',
		['hash'] = `issi6`,
		
	},
	['panto'] = {
		['name'] = 'Panto',
		['brand'] = 'Benefactor',
		['model'] = 'panto',
		['price'] = 3200,
		['category'] = 'compacts',
		['hash'] = `panto`,
		
	},
	['prairie'] = {
		['name'] = 'Prairie',
		['brand'] = 'Bollokan',
		['model'] = 'prairie',
		['price'] = 30000,
		['category'] = 'compacts',
		['hash'] = `prairie`,
		
	},
	['rhapsody'] = {
		['name'] = 'Rhapsody',
		['brand'] = 'Declasse',
		['model'] = 'rhapsody',
		['price'] = 10000,
		['category'] = 'compacts',
		['hash'] = `rhapsody`,
		
	},
	['brioso2'] = {
		['name'] = 'Brioso 300',
		['brand'] = 'Grotti',
		['model'] = 'brioso2',
		['price'] = 12000,
		['category'] = 'compacts',
		['hash'] = `brioso2`,
		
	},
	['weevil'] = {
		['name'] = 'Weevil',
		['brand'] = 'BF',
		['model'] = 'weevil',
		['price'] = 9000,
		['category'] = 'compacts',
		['hash'] = `weevil`,
		
	},
	--- Coupes
	['cogcabrio'] = {
		['name'] = 'Cognoscenti Cabrio',
		['brand'] = 'Enus',
		['model'] = 'cogcabrio',
		['price'] = 30000,
		['category'] = 'coupes',
		['hash'] = `cogcabrio`,
		
	},
	['exemplar'] = {
		['name'] = 'Exemplar',
		['brand'] = 'Dewbauchee',
		['model'] = 'exemplar',
		['price'] = 40000,
		['category'] = 'coupes',
		['hash'] = `exemplar`,
		
	},
	['f620'] = {
		['name'] = 'F620',
		['brand'] = 'Ocelot',
		['model'] = 'f620',
		['price'] = 32500,
		['category'] = 'coupes',
		['hash'] = `f620`,
		
	},
	['felon'] = {
		['name'] = 'Felon',
		['brand'] = 'Lampadati',
		['model'] = 'felon',
		['price'] = 31000,
		['category'] = 'coupes',
		['hash'] = `felon`,
		
	},
	['felon2'] = {
		['name'] = 'Felon GT',
		['brand'] = 'Lampadati',
		['model'] = 'felon2',
		['price'] = 37000,
		['category'] = 'coupes',
		['hash'] = `felon2`,
		
	},
	['jackal'] = {
		['name'] = 'Jackal',
		['brand'] = 'Ocelot',
		['model'] = 'jackal',
		['price'] = 19000,
		['category'] = 'coupes',
		['hash'] = `jackal`,
		
	},
	['oracle'] = {
		['name'] = 'Oracle',
		['brand'] = 'Ubermacht',
		['model'] = 'oracle',
		['price'] = 22000,
		['category'] = 'sedans',
		['hash'] = `oracle`,
		
	},
	['oracle2'] = {
		['name'] = 'Oracle XS',
		['brand'] = 'Übermacht',
		['model'] = 'oracle2',
		['price'] = 28000,
		['category'] = 'coupes',
		['hash'] = `oracle2`,
		
	},
	['sentinel'] = {
		['name'] = 'Sentinel',
		['brand'] = 'Übermacht',
		['model'] = 'sentinel',
		['price'] = 30000,
		['category'] = 'coupes',
		['hash'] = `sentinel`,
		
	},
	['sentinel2'] = {
		['name'] = 'Sentinel XS',
		['brand'] = ' Übermacht',
		['model'] = 'sentinel2',
		['price'] = 33000,
		['category'] = 'coupes',
		['hash'] = `sentinel2`,
		
	},
	['windsor'] = {
		['name'] = 'Windsor',
		['brand'] = 'Enus',
		['model'] = 'windsor',
		['price'] = 27000,
		['category'] = 'coupes',
		['hash'] = `windsor`,
		
	},
	['windsor2'] = {
		['name'] = 'Windsor Drop',
		['brand'] = 'Enus',
		['model'] = 'windsor2',
		['price'] = 34000,
		['category'] = 'coupes',
		['hash'] = `windsor2`,
		
	},
	['zion'] = {
		['name'] = 'Zion',
		['brand'] = 'Übermacht',
		['model'] = 'zion',
		['price'] = 22000,
		['category'] = 'coupes',
		['hash'] = `zion`,
		
	},
	['zion2'] = {
		['name'] = 'Zion Cabrio',
		['brand'] = 'Übermacht',
		['model'] = 'zion2',
		['price'] = 28000,
		['category'] = 'coupes',
		['hash'] = `zion2`,
		
	},
	['previon'] = {			--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Previon',
		['brand'] = 'Karin',
		['model'] = 'previon',
		['price'] = 149000,
		['category'] = 'coupes',
		['hash'] = `previon`,
		
	},
	['champion'] = {		--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Champion',
		['brand'] = 'Dewbauchee',
		['model'] = 'champion',
		['price'] = 205000,
		['category'] = 'coupes',
		['hash'] = `champion`,
		
	},
	['ignus'] = { 	 	--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Ignus',
		['brand'] = 'Pegassi',
		['model'] = 'ignus',
		['price'] = 1120000,
		['category'] = 'coupes',
		['hash'] = `ignus`,
		
	},
	['zeno'] = { 	 	--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Zeno',
		['brand'] = 'Overflod',
		['model'] = 'zeno',
		['price'] = 1350000,
		['category'] = 'coupes',
		['hash'] = `zeno`,
		
	},
	--- Cycles
	['bmx'] = {
		['name'] = 'BMX',
        ['brand'] = 'Bike',
		['model'] = 'bmx',
		['price'] = 160,
		['category'] = 'cycles',
		['hash'] = `bmx`,
		
	},
	['cruiser'] = {
		['name'] = 'Cruiser',
        ['brand'] = 'Bike',
		['model'] = 'cruiser',
		['price'] = 510,
		['category'] = 'cycles',
		['hash'] = `cruiser`,
		
	},
	['fixter'] = {
		['name'] = 'Fixter',
        ['brand'] = 'Bike',
		['model'] = 'fixter',
		['price'] = 225,
		['category'] = 'cycles',
		['hash'] = `fixter`,
		
	},
	['scorcher'] = {
		['name'] = 'Scorcher',
        ['brand'] = 'Bike',
		['model'] = 'scorcher',
		['price'] = 280,
		['category'] = 'cycles',
		['hash'] = `scorcher`,
		
	},
	['tribike'] = {
		['name'] = 'Tri Bike',
        ['brand'] = 'Bike',
		['model'] = 'tribike',
		['price'] = 500,
		['category'] = 'cycles',
		['hash'] = `tribike`,
		
	},
	['tribike2'] = {
		['name'] = 'Tri Bike 2',
        ['brand'] = 'Bike',
		['model'] = 'tribike2',
		['price'] = 700,
		['category'] = 'cycles',
		['hash'] = `tribike2`,
		
	},
	['tribike3'] = {
		['name'] = 'Tri Bike 3',
        ['brand'] = 'Bike',
		['model'] = 'tribike3',
		['price'] = 520,
		['category'] = 'cycles',
		['hash'] = `tribike3`,
		
	},
	--- Motorcycles
	['akuma'] = {
		['name'] = 'Akuma',
		['brand'] = 'Dinka',
		['model'] = 'akuma',
		['price'] = 55000,
		['category'] = 'motorcycles',
		['hash'] = `akuma`,
		
	},
	['avarus'] = {
		['name'] = 'Avarus',
		['brand'] = 'LCC',
		['model'] = 'avarus',
		['price'] = 20000,
		['category'] = 'motorcycles',
		['hash'] = `avarus`,
		
	},
	['bagger'] = {
		['name'] = 'Bagger',
		['brand'] = 'WMC',
		['model'] = 'bagger',
		['price'] = 13500,
		['category'] = 'motorcycles',
		['hash'] = `bagger`,
		
	},
	['bati'] = {
		['name'] = 'Bati 801',
		['brand'] = 'Pegassi',
		['model'] = 'bati',
		['price'] = 24000,
		['category'] = 'motorcycles',
		['hash'] = `bati`,
		
	},
	['bati2'] = {
		['name'] = 'Bati 801RR',
		['brand'] = 'Pegassi',
		['model'] = 'bati2',
		['price'] = 19000,
		['category'] = 'motorcycles',
		['hash'] = `bati2`,
		
	},
	['bf400'] = {
		['name'] = 'BF400',
		['brand'] = 'Nagasaki',
		['model'] = 'bf400',
		['price'] = 22000,
		['category'] = 'motorcycles',
		['hash'] = `bf400`,
		
	},
	['carbonrs'] = {
		['name'] = 'Carbon RS',
		['brand'] = 'Nagasaki',
		['model'] = 'carbonrs',
		['price'] = 22000,
		['category'] = 'motorcycles',
		['hash'] = `carbonrs`,
		
	},
	['chimera'] = {
		['name'] = 'Chimera',
		['brand'] = 'Nagasaki',
		['model'] = 'chimera',
		['price'] = 21000,
		['category'] = 'motorcycles',
		['hash'] = `chimera`,
		
	},
	['cliffhanger'] = {
		['name'] = 'Cliffhanger',
		['brand'] = 'Western',
		['model'] = 'cliffhanger',
		['price'] = 28500,
		['category'] = 'motorcycles',
		['hash'] = `cliffhanger`,
		
	},
	['daemon'] = {
		['name'] = 'Daemon',
		['brand'] = 'WMC',
		['model'] = 'daemon',
		['price'] = 14000,
		['category'] = 'motorcycles',
		['hash'] = `daemon`,
		
	},
	['daemon2'] = {
		['name'] = 'Daemon Custom',
		['brand'] = 'Western',
		['model'] = 'daemon2',
		['price'] = 23000,
		['category'] = 'motorcycles',
		['hash'] = `daemon2`,
		
	},
	['defiler'] = {
		['name'] = 'Defiler',
		['brand'] = 'Shitzu',
		['model'] = 'defiler',
		['price'] = 30000,
		['category'] = 'motorcycles',
		['hash'] = `defiler`,
		
	},
	['deathbike'] = {							--DLC
		['name'] = 'deathbike',
		['brand'] = 'deathbike',
		['model'] = 'deathbike',
		['price'] = 30000,
		['category'] = 'motorcycles',
		['hash'] = `deathbike`,
		
	},
	['deathbike2'] = {							--DLC
		['name'] = 'deathbike2',
		['brand'] = 'deathbike',
		['model'] = 'deathbike2',
		['price'] = 30000,
		['category'] = 'motorcycles',
		['hash'] = `deathbike2`,
		
	},
	['deathbike3'] = {							--DLC
		['name'] = 'deathbike3',
		['brand'] = 'deathbike',
		['model'] = 'deathbike3',
		['price'] = 30000,
		['category'] = 'motorcycles',
		['hash'] = `deathbike3`,
		
	},
	['diablous'] = {
		['name'] = 'Diablous',
		['brand'] = 'Principe',
		['model'] = 'diablous',
		['price'] = 30000,
		['category'] = 'motorcycles',
		['hash'] = `diablous`,
		
	},
	['diablous2'] = {
		['name'] = 'Diablous Custom',
		['brand'] = 'Principe',
		['model'] = 'diablous2',
		['price'] = 38000,
		['category'] = 'motorcycles',
		['hash'] = `diablous2`,
		
	},
	['double'] = {
		['name'] = 'Double-T',
		['brand'] = 'Dinka',
		['model'] = 'double',
		['price'] = 28000,
		['category'] = 'motorcycles',
		['hash'] = `double`,
		
	},
	['enduro'] = {
		['name'] = 'Enduro',
		['brand'] = 'Dinka',
		['model'] = 'enduro',
		['price'] = 5500,
		['category'] = 'motorcycles',
		['hash'] = `enduro`,
		
	},
	['esskey'] = {
		['name'] = 'Esskey',
		['brand'] = 'Pegassi',
		['model'] = 'esskey',
		['price'] = 12000,
		['category'] = 'motorcycles',
		['hash'] = `esskey`,
		
	},
	['faggio'] = {
		['name'] = 'Faggio Sport',
		['brand'] = 'Pegassi',
		['model'] = 'faggio',
		['price'] = 2000,
		['category'] = 'motorcycles',
		['hash'] = `faggio`,
		
	},
	['faggio2'] = {
		['name'] = 'Faggio',
		['brand'] = 'Pegassi',
		['model'] = 'faggio2',
		['price'] = 1900,
		['category'] = 'motorcycles',
		['hash'] = `faggio2`,
		
	},
	['faggio3'] = {
		['name'] = 'Faggio Mod',
		['brand'] = 'Pegassi',
		['model'] = 'faggio3',
		['price'] = 2500,
		['category'] = 'motorcycles',
		['hash'] = `faggio3`,
		
	},
	['fcr'] = {
		['name'] = 'FCR 1000',
		['brand'] = 'Pegassi',
		['model'] = 'fcr',
		['price'] = 5000,
		['category'] = 'motorcycles',
		['hash'] = `fcr`,
		
	},
	['fcr2'] = {
		['name'] = 'FCR 1000 Custom',
		['brand'] = 'Pegassi',
		['model'] = 'fcr2',
		['price'] = 19000,
		['category'] = 'motorcycles',
		['hash'] = `fcr2`,
		
	},
	['gargoyle'] = {
		['name'] = 'Gargoyle',
		['brand'] = 'Western',
		['model'] = 'gargoyle',
		['price'] = 32000,
		['category'] = 'motorcycles',
		['hash'] = `gargoyle`,
		
	},
	['hakuchou'] = {
		['name'] = 'Hakuchou',
		['brand'] = 'Shitzu',
		['model'] = 'hakuchou',
		['price'] = 17000,
		['category'] = 'motorcycles',
		['hash'] = `hakuchou`,
		
	},
	['hakuchou2'] = {
		['name'] = 'Hakuchou Drag',
		['brand'] = 'Shitzu',
		['model'] = 'hakuchou2',
		['price'] = 45000,
		['category'] = 'motorcycles',
		['hash'] = `hakuchou2`,
		
	},
	['hexer'] = {
		['name'] = 'Hexer',
		['brand'] = 'LCC',
		['model'] = 'hexer',
		['price'] = 16000,
		['category'] = 'motorcycles',
		['hash'] = `hexer`,
		
	},
	['innovation'] = {
		['name'] = 'Innovation',
		['brand'] = 'LLC',
		['model'] = 'innovation',
		['price'] = 33500,
		['category'] = 'motorcycles',
		['hash'] = `innovation`,
		
	},
	['lectro'] = {
		['name'] = 'Lectro',
		['brand'] = 'Principe',
		['model'] = 'lectro',
		['price'] = 28000,
		['category'] = 'motorcycles',
		['hash'] = `lectro`,
		
	},
	['manchez'] = {
		['name'] = 'Manchez',
		['brand'] = 'Maibatsu',
		['model'] = 'manchez',
		['price'] = 8300,
		['category'] = 'motorcycles',
		['hash'] = `manchez`,
		
	},
	['nemesis'] = {
		['name'] = 'Nemesis',
		['brand'] = 'Principe',
		['model'] = 'nemesis',
		['price'] = 20000,
		['category'] = 'motorcycles',
		['hash'] = `nemesis`,
		
	},
	['nightblade'] = {
		['name'] = 'Nightblade',
		['brand'] = 'WMC',
		['model'] = 'nightblade',
		['price'] = 23000,
		['category'] = 'motorcycles',
		['hash'] = `nightblade`,
		
	},
	['oppressor'] = {
		['name'] = 'Oppressor',
		['brand'] = 'Pegassi',
		['model'] = 'oppressor',
		['price'] = 9999999,
		['category'] = 'super',
		['hash'] = `oppressor`,
		['shop'] = 'luxury',
	},
	['pcj'] = {
		['name'] = 'PCJ-600',
		['brand'] = 'Shitzu',
		['model'] = 'pcj',
		['price'] = 15000,
		['category'] = 'motorcycles',
		['hash'] = `pcj`,
		
	},
	['ratbike'] = {
		['name'] = 'Rat Bike',
		['brand'] = 'Western',
		['model'] = 'ratbike',
		['price'] = 3000,
		['category'] = 'motorcycles',
		['hash'] = `ratbike`,
		
	},
	['ruffian'] = {
		['name'] = 'Ruffian',
		['brand'] = 'Pegassi',
		['model'] = 'ruffian',
		['price'] = 25000,
		['category'] = 'motorcycles',
		['hash'] = `ruffian`,
		
	},
	['sanchez'] = {
		['name'] = 'Sanchez Livery',
		['brand'] = 'Maibatsu',
		['model'] = 'sanchez',
		['price'] = 5300,
		['category'] = 'motorcycles',
		['hash'] = `sanchez`,
		
	},
	['sanchez2'] = {
		['name'] = 'Sanchez',
		['brand'] = 'Maibatsu',
		['model'] = 'sanchez2',
		['price'] = 5300,
		['category'] = 'motorcycles',
		['hash'] = `sanchez2`,
		
	},
	['sanctus'] = {
		['name'] = 'Sanctus',
		['brand'] = 'LCC',
		['model'] = 'sanctus',
		['price'] = 35000,
		['category'] = 'motorcycles',
		['hash'] = `sanctus`,
		
	},
	['shotaro'] = {
		['name'] = 'Shotaro Concept',
		['brand'] = 'Nagasaki',
		['model'] = 'shotaro',
		['price'] = 320000,
		['category'] = 'motorcycles',
		['hash'] = `shotaro`,
		
	},
	['sovereign'] = {
		['name'] = 'Sovereign',
		['brand'] = 'WMC',
		['model'] = 'sovereign',
		['price'] = 8000,
		['category'] = 'motorcycles',
		['hash'] = `sovereign`,
		
	},
	['stryder'] = {
		['name'] = 'Stryder',
		['brand'] = 'Nagasaki',
		['model'] = 'stryder',
		['price'] = 50000,
		['category'] = 'motorcycles',
		['hash'] = `stryder`,
		
	},
	['thrust'] = {
		['name'] = 'Thrust',
		['brand'] = 'Dinka',
		['model'] = 'thrust',
		['price'] = 22000,
		['category'] = 'motorcycles',
		['hash'] = `thrust`,
		
	},
	['vader'] = {
		['name'] = 'Vader',
		['brand'] = 'Shitzu',
		['model'] = 'vader',
		['price'] = 7200,
		['category'] = 'motorcycles',
		['hash'] = `vader`,
		
	},
	['vindicator'] = {
		['name'] = 'Vindicator',
		['brand'] = 'Dinka',
		['model'] = 'vindicator',
		['price'] = 19000,
		['category'] = 'motorcycles',
		['hash'] = `vindicator`,
		
	},
	['vortex'] = {
		['name'] = 'Vortex',
		['brand'] = 'Pegassi',
		['model'] = 'vortex',
		['price'] = 31000,
		['category'] = 'motorcycles',
		['hash'] = `vortex`,
		
	},
	['wolfsbane'] = {
		['name'] = 'Wolfsbane',
		['brand'] = 'Western',
		['model'] = 'wolfsbane',
		['price'] = 14000,
		['category'] = 'motorcycles',
		['hash'] = `wolfsbane`,
		
	},
	['zombiea'] = {
		['name'] = 'Zombie Bobber',
		['brand'] = 'Western',
		['model'] = 'zombiea',
		['price'] = 28000,
		['category'] = 'motorcycles',
		['hash'] = `zombiea`,
		
	},
	['zombieb'] = {
		['name'] = 'Zombie Chopper',
		['brand'] = 'Western',
		['model'] = 'zombieb',
		['price'] = 27000,
		['category'] = 'motorcycles',
		['hash'] = `zombieb`,
		
	},
	['manchez2'] = {
		['name'] = 'Manchez',
		['brand'] = 'Maibatsu',
		['model'] = 'manchez2',
		['price'] = 14000,
		['category'] = 'motorcycles',
		['hash'] = `manchez2`,
		
	},
	['shinobi'] = {		--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Shinobi',
		['brand'] = 'Nagasaki',
		['model'] = 'shinobi',
		['price'] = 25000,
		['category'] = 'motorcycles',
		['hash'] = `shinobi`,
		
	},
	['reever'] = {		--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Reever',
		['brand'] = 'Western',
		['model'] = 'reever',
		['price'] = 25000,
		['category'] = 'motorcycles',
		['hash'] = `reever`,
		
	},
	--- Muscle
	['blade'] = {
		['name'] = 'Blade',
		['brand'] = 'Vapid',
		['model'] = 'blade',
		['price'] = 23500,
		['category'] = 'muscle',
		['hash'] = `blade`,
		
	},
	['buccaneer'] = {
		['name'] = 'Buccaneer',
		['brand'] = 'Albany',
		['model'] = 'buccaneer',
		['price'] = 22500,
		['category'] = 'muscle',
		['hash'] = `buccaneer`,
		
	},
	['buccaneer2'] = {
		['name'] = 'Buccaneer Rider',
		['brand'] = 'Albany',
		['model'] = 'buccaneer2',
		['price'] = 24500,
		['category'] = 'muscle',
		['hash'] = `buccaneer2`,
		
	},
	['chino'] = {
		['name'] = 'Chino',
		['brand'] = 'Vapid',
		['model'] = 'chino',
		['price'] = 5000,
		['category'] = 'muscle',
		['hash'] = `chino`,
		
	},
	['chino2'] = {
		['name'] = 'Chino Luxe',
		['brand'] = 'Vapid',
		['model'] = 'chino2',
		['price'] = 8000,
		['category'] = 'muscle',
		['hash'] = `chino2`,
		
	},
	['clique'] = {							--DLC
		['name'] = 'Clique',
		['brand'] = 'Vapid',
		['model'] = 'clique',
		['price'] = 20000,
		['category'] = 'muscle',
		['hash'] = `clique`,
		
	},
	['coquette3'] = {
		['name'] = 'Coquette BlackFin',
		['brand'] = 'Invetero',
		['model'] = 'coquette3',
		['price'] = 180000,
		['category'] = 'muscle',
		['hash'] = `coquette3`,
		
	},
	['deviant'] = {							--DLC
		['name'] = 'Deviant',
		['brand'] = 'Schyster',
		['model'] = 'deviant',
		['price'] = 70000,
		['category'] = 'muscle',
		['hash'] = `deviant`,
		
	},
	['dominator'] = {
		['name'] = 'Dominator',
		['brand'] = 'Vapid',
		['model'] = 'dominator',
		['price'] = 62500,
		['category'] = 'muscle',
		['hash'] = `dominator`,
		
	},
	['dominator2'] = {
		['name'] = 'Pißwasser Dominator',
		['brand'] = 'Vapid',
		['model'] = 'dominator2',
		['price'] = 50000,
		['category'] = 'muscle',
		['hash'] = `dominator2`,
		
	},
	['dominator3'] = {
		['name'] = 'Dominator GTX',
		['brand'] = 'Vapid',
		['model'] = 'dominator3',
		['price'] = 70000,
		['category'] = 'muscle',
		['hash'] = `dominator3`,
		
	},
	['dominator4'] = {							--DLC
		['name'] = 'Dominator Arena',
		['brand'] = 'Vapid',
		['model'] = 'dominator4',
		['price'] = 200000,
		['category'] = 'muscle',
		['hash'] = `dominator4`,
		
	},
	['dominator7'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Dominator ASP',
		['brand'] = 'Vapid',
		['model'] = 'dominator7',
		['price'] = 110000,
		['category'] = 'muscle',
		['hash'] = `dominator7`,
		
	},
	['dominator8'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Dominator GTT',
		['brand'] = 'Vapid',
		['model'] = 'dominator8',
		['price'] = 80000,
		['category'] = 'muscle',
		['hash'] = `dominator8`,
		
	},
	['dukes'] = {
		['name'] = 'Dukes',
		['brand'] = 'Imponte',
		['model'] = 'dukes',
		['price'] = 23500,
		['category'] = 'muscle',
		['hash'] = `dukes`,
		
	},
	['dukes2'] = {
		['name'] = 'Dukes Nightrider',
		['brand'] = 'Imponte',
		['model'] = 'dukes2',
		['price'] = 60000,
		['category'] = 'muscle',
		['hash'] = `dukes2`,
		
	},
	['dukes3'] = {
		['name'] = 'Beater Dukes',
		['brand'] = 'Imponte',
		['model'] = 'dukes3',
		['price'] = 45000,
		['category'] = 'muscle',
		['hash'] = `dukes3`,
		
	},
	['faction'] = {
		['name'] = 'Faction',
		['brand'] = 'Willard',
		['model'] = 'faction',
		['price'] = 17000,
		['category'] = 'muscle',
		['hash'] = `faction`,
		
	},
	['faction2'] = {
		['name'] = 'Faction Rider',
		['brand'] = 'Willard',
		['model'] = 'faction2',
		['price'] = 19000,
		['category'] = 'muscle',
		['hash'] = `faction2`,
		
	},
	['faction3'] = {
		['name'] = 'Faction Custom Donk',
		['brand'] = 'Willard',
		['model'] = 'faction3',
		['price'] = 35000,
		['category'] = 'muscle',
		['hash'] = `faction3`,
		
	},
	['ellie'] = {
		['name'] = 'Ellie',
		['brand'] = 'Vapid',
		['model'] = 'ellie',
		['price'] = 42250,
		['category'] = 'muscle',
		['hash'] = `ellie`,
		
	},
	['gauntlet'] = {
		['name'] = 'Gauntlet',
		['brand'] = 'Bravado',
		['model'] = 'gauntlet',
		['price'] = 28500,
		['category'] = 'muscle',
		['hash'] = `gauntlet`,
		
	},
	['gauntlet2'] = {
		['name'] = 'Redwood Gauntlet',
		['brand'] = 'Bravado',
		['model'] = 'gauntlet2',
		['price'] = 70000,
		['category'] = 'muscle',
		['hash'] = `gauntlet2`,
		
	},
	['gauntlet3'] = {							--DLC
		['name'] = 'Classic Gauntlet',
		['brand'] = 'Bravado',
		['model'] = 'gauntlet3',
		['price'] = 75000,
		['category'] = 'muscle',
		['hash'] = `gauntlet3`,
		
	},
	['gauntlet4'] = {							--DLC
		['name'] = 'Gauntlet Hellfire',
		['brand'] = 'Bravado',
		['model'] = 'gauntlet4',
		['price'] = 80000,
		['category'] = 'muscle',
		['hash'] = `gauntlet4`,
		
	},
	['gauntlet5'] = {
		['name'] = 'Gauntlet Classic Custom',
		['brand'] = 'Bravado',
		['model'] = 'gauntlet5',
		['price'] = 120000,
		['category'] = 'muscle',
		['hash'] = `gauntlet5`,
		
	},
	['hermes'] = {
		['name'] = 'Hermes',
		['brand'] = 'Albany',
		['model'] = 'hermes',
		['price'] = 535000,
		['category'] = 'muscle',
		['hash'] = `hermes`,
		
	},
	['hotknife'] = {
		['name'] = 'Hotknife',
		['brand'] = 'Vapid',
		['model'] = 'hotknife',
		['price'] = 90000,
		['category'] = 'muscle',
		['hash'] = `hotknife`,
		
	},
	['hustler'] = {
		['name'] = 'Hustler',
		['brand'] = 'Vapid',
		['model'] = 'hustler',
		['price'] = 95000,
		['category'] = 'muscle',
		['hash'] = `hustler`,
		
	},
	['impaler'] = {							--DLC
		['name'] = 'impaler',
		['brand'] = 'Vapid',
		['model'] = 'impaler',
		['price'] = 95000,
		['category'] = 'muscle',
		['hash'] = `impaler`,
		
	},
	['impaler2'] = {							--DLC
		['name'] = 'impaler2',
		['brand'] = 'Vapid',
		['model'] = 'impaler2',
		['price'] = 95000,
		['category'] = 'muscle',
		['hash'] = `impaler2`,
		
	},
	['impaler3'] = {							--DLC
		['name'] = 'impaler3',
		['brand'] = 'Vapid',
		['model'] = 'impaler3',
		['price'] = 95000,
		['category'] = 'muscle',
		['hash'] = `impaler3`,
		
	},
	['impaler4'] = {							--DLC
		['name'] = 'impaler4',
		['brand'] = 'Vapid',
		['model'] = 'impaler4',
		['price'] = 95000,
		['category'] = 'muscle',
		['hash'] = `impaler4`,
		
	},
	['imperator'] = {							--DLC
		['name'] = 'imperator',
		['brand'] = 'Vapid',
		['model'] = 'imperator',
		['price'] = 95000,
		['category'] = 'muscle',
		['hash'] = `imperator`,
		
	},
	['imperator2'] = {							--DLC
		['name'] = 'imperator2',
		['brand'] = 'Vapid',
		['model'] = 'imperator2',
		['price'] = 95000,
		['category'] = 'muscle',
		['hash'] = `imperator2`,
		
	},
	['imperator3'] = {							--DLC
		['name'] = 'imperator3',
		['brand'] = 'Vapid',
		['model'] = 'imperator3',
		['price'] = 95000,
		['category'] = 'muscle',
		['hash'] = `imperator3`,
		
	},
	['lurcher'] = {
		['name'] = 'Gauntlet Classic Custom',
		['brand'] = 'Bravado',
		['model'] = 'lurcher',
		['price'] = 21000,
		['category'] = 'muscle',
		['hash'] = `lurcher`,
		
	},
	['moonbeam'] = {
		['name'] = 'Moonbeam',
		['brand'] = 'Declasse',
		['model'] = 'moonbeam',
		['price'] = 13000,
		['category'] = 'vans',
		['hash'] = `moonbeam`,
		
	},
	['moonbeam2'] = {
		['name'] = 'Moonbeam Custom',
		['brand'] = 'Declasse',
		['model'] = 'moonbeam2',
		['price'] = 15000,
		['category'] = 'vans',
		['hash'] = `moonbeam2`,
		
	},
	['nightshade'] = {
		['name'] = 'Nightshade',
		['brand'] = 'Imponte',
		['model'] = 'nightshade',
		['price'] = 70000,
		['category'] = 'muscle',
		['hash'] = `nightshade`,
		
	},
	['peyote2'] = {							--DLC
		['name'] = 'Peyote Gasser',
		['brand'] = 'Vapid',
		['model'] = 'peyote2',
		['price'] = 40000,
		['category'] = 'sportsclassics',
		['hash'] = `peyote2`,
		
	},
	['phoenix'] = {
		['name'] = 'Phoenix',
		['brand'] = 'Imponte',
		['model'] = 'phoenix',
		['price'] = 65000,
		['category'] = 'muscle',
		['hash'] = `phoenix`,
		
	},
	['picador'] = {
		['name'] = 'Picador',
		['brand'] = 'Cheval',
		['model'] = 'picador',
		['price'] = 20000,
		['category'] = 'muscle',
		['hash'] = `picador`,
		
	},
	['ratloader2'] = {
		['name'] = 'ratloader2',
		['brand'] = 'Ratloader2',
		['model'] = 'ratloader2',
		['price'] = 20000,
		['category'] = 'muscle',
		['hash'] = `ratloader2`,
		
	},
	['ruiner'] = {
		['name'] = 'Ruiner',
		['brand'] = 'Imponte',
		['model'] = 'ruiner',
		['price'] = 29000,
		['category'] = 'muscle',
		['hash'] = `ruiner`,
		
	},
	['ruiner2'] = {
		['name'] = 'Ruiner 2000',
		['brand'] = 'Imponte',
		['model'] = 'ruiner2',
		['price'] = 50000,
		['category'] = 'muscle',
		['hash'] = `ruiner2`,
		
	},
	['sabregt'] = {
		['name'] = 'Sabre Turbo',
		['brand'] = 'Declasse',
		['model'] = 'sabregt',
		['price'] = 23000,
		['category'] = 'muscle',
		['hash'] = `sabregt`,
		
	},
	['sabregt2'] = {
		['name'] = 'Sabre GT',
		['brand'] = 'Declasse',
		['model'] = 'sabregt2',
		['price'] = 26500,
		['category'] = 'muscle',
		['hash'] = `sabregt2`,
		
	},
	['slamvan'] = {
		['name'] = 'Slam Van',
		['brand'] = 'Vapid',
		['model'] = 'slamvan',
		['price'] = 30000,
		['category'] = 'muscle',
		['hash'] = `slamvan`,
		
	},
	['slamvan2'] = {
		['name'] = 'Lost Slam Van',
		['brand'] = 'Vapid',
		['model'] = 'slamvan2',
		['price'] = 90000,
		['category'] = 'muscle',
		['hash'] = `slamvan2`,
		
	},
	['slamvan3'] = {
		['name'] = 'Slam Van Custom',
		['brand'] = 'Vapid',
		['model'] = 'slamvan3',
		['price'] = 17000,
		['category'] = 'muscle',
		['hash'] = `slamvan3`,
		
	},
	['stalion'] = {
		['name'] = 'Stallion',
		['brand'] = 'Declasse',
		['model'] = 'stalion',
		['price'] = 33000,
		['category'] = 'muscle',
		['hash'] = `stalion`,
		
	},
	['stalion2'] = {
		['name'] = 'Stallion Burgershot',
		['brand'] = 'Declasse',
		['model'] = 'stalion2',
		['price'] = 40000,
		['category'] = 'muscle',
		['hash'] = `stalion2`,
		
	},
	['tampa'] = {
		['name'] = 'Tampa',
		['brand'] = 'Declasse',
		['model'] = 'tampa',
		['price'] = 24500,
		['category'] = 'muscle',
		['hash'] = `tampa`,
		
	},
	['tulip'] = {							--DLC
		['name'] = 'Tulip',
		['brand'] = 'Declasse',
		['model'] = 'tulip',
		['price'] = 80000,
		['category'] = 'muscle',
		['hash'] = `tulip`,
		
	},
	['vamos'] = {							--DLC
		['name'] = 'Vamos',
		['brand'] = 'Declasse',
		['model'] = 'vamos',
		['price'] = 30000,
		['category'] = 'muscle',
		['hash'] = `vamos`,
		
	},
	['vigero'] = {
		['name'] = 'Vigero',
		['brand'] = 'Declasse',
		['model'] = 'vigero',
		['price'] = 39500,
		['category'] = 'muscle',
		['hash'] = `vigero`,
		
	},
	['virgo'] = {
		['name'] = 'Virgo',
		['brand'] = 'Albany',
		['model'] = 'virgo',
		['price'] = 22000,
		['category'] = 'muscle',
		['hash'] = `virgo`,
		
	},
	['virgo2'] = {
		['name'] = 'Virgo Custom Classic',
		['brand'] = 'Dundreary',
		['model'] = 'virgo2',
		['price'] = 21000,
		['category'] = 'muscle',
		['hash'] = `virgo2`,
		
	},
	['virgo3'] = {
		['name'] = 'Virgo Custom Classic',
		['brand'] = 'Dundreary',
		['model'] = 'virgo3',
		['price'] = 21000,
		['category'] = 'muscle',
		['hash'] = `virgo3`,
		
	},
	['voodoo'] = {
		['name'] = 'Voodoo',
		['brand'] = 'Declasse',
		['model'] = 'voodoo',
		['price'] = 13000,
		['category'] = 'muscle',
		['hash'] = `voodoo`,
		
	},
	['yosemite'] = {
		['name'] = 'Yosemite',
		['brand'] = 'Declasse',
		['model'] = 'yosemite',
		['price'] = 19500,
		['category'] = 'muscle',
		['hash'] = `yosemite`,
		
	},
	['yosemite2'] = {
		['name'] = 'Yosemite Drift',
		['brand'] = 'Declasse',
		['model'] = 'yosemite2',
		['price'] = 55000,
		['category'] = 'muscle',
		['hash'] = `yosemite2`,
		
	},
	['yosemite3'] = {
		['name'] = 'Yosemite Rancher',
		['brand'] = 'Declasse',
		['price'] = 425000,
		['category'] = 'offroad',
		['model'] = 'yosemite3',
		['hash'] = `yosemite3`,
		
	},
	['buffalo4'] = { 	 	--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Buffalo STX',
		['brand'] = 'Bravado',
		['model'] = 'buffalo4',
		['price'] = 345000,
		['category'] = 'muscle',
		['hash'] = `buffalo4`,
		
	},
	--- Off-Road
	['bfinjection'] = {
		['name'] = 'Bf Injection',
		['brand'] = 'Annis',
		['price'] = 9000,
		['category'] = 'offroad',
		['model'] = 'bfinjection',
		['hash'] = `bfinjection`,
		
	},
	['bifta'] = {
		['name'] = 'Bifta',
		['brand'] = 'Annis',
		['price'] = 15500,
		['category'] = 'offroad',
		['model'] = 'bifta',
		['hash'] = `bifta`,
		
	},
	['blazer'] = {
		['name'] = 'Blazer',
		['brand'] = 'Annis',
		['price'] = 7500,
		['category'] = 'offroad',
		['model'] = 'blazer',
		['hash'] = `blazer`,
		
	},
	['blazer2'] = {
		['name'] = 'Blazer Lifeguard',
		['brand'] = 'Nagasaki',
		['model'] = 'blazer2',
		['price'] = 7000,
		['category'] = 'offroad',
		['hash'] = `blazer2`,
		
	},
	['blazer3'] = {
		['name'] = 'Blazer Hot Rod',
		['brand'] = 'Nagasaki',
		['model'] = 'blazer3',
		['price'] = 7000,
		['category'] = 'offroad',
		['hash'] = `blazer3`,
		
	},
	['blazer4'] = {
		['name'] = 'Blazer Sport',
		['brand'] = 'Annis',
		['price'] = 9250,
		['category'] = 'offroad',
		['model'] = 'blazer4',
		['hash'] = `blazer4`,
		
	},
	['blazer5'] = {
		['name'] = 'Blazer Aqua',
		['brand'] = 'Nagasaki',
		['model'] = 'blazer5',
		['price'] = 40000,
		['category'] = 'offroad',
		['hash'] = `blazer5`,
		
	},
	['brawler'] = {
		['name'] = 'Brawler',
		['brand'] = 'Annis',
		['price'] = 40000,
		['category'] = 'offroad',
		['model'] = 'brawler',
		['hash'] = `brawler`,
		
	},
	['caracara'] = {
		['name'] = 'Caracara',
		['brand'] = 'Vapid',
		['model'] = 'caracara',
		['price'] = 60000,
		['category'] = 'offroad',
		['hash'] = `caracara`,
		
	},
	['caracara2'] = {							--DLC
		['name'] = 'Caracara 4x4',
		['brand'] = 'Vapid',
		['model'] = 'caracara2',
		['price'] = 80000,
		['category'] = 'offroad',
		['hash'] = `caracara2`,
		
	},
	['dubsta3'] = {
		['name'] = 'Dubsta 6x6',
		['brand'] = 'Annis',
		['price'] = 34000,
		['category'] = 'offroad',
		['model'] = 'dubsta3',
		['hash'] = `dubsta3`,
		
	},
	['dune'] = {
		['name'] = 'Dune Buggy',
		['brand'] = 'Annis',
		['price'] = 14000,
		['category'] = 'offroad',
		['model'] = 'dune',
		['hash'] = `dune`,
		
	},
	['everon'] = {
		['name'] = 'Everon',
		['brand'] = 'Karin',
		['model'] = 'everon',
		['price'] = 60000,
		['category'] = 'offroad',
		['hash'] = `everon`,
		
	},
	['freecrawler'] = {							--DLC
		['name'] = 'Freecrawler',
		['brand'] = 'Canis',
		['model'] = 'freecrawler',
		['price'] = 24000,
		['category'] = 'offroad',
		['hash'] = `freecrawler`,
		
	},
	['hellion'] = {							--DLC
		['name'] = 'Hellion',
		['brand'] = 'Annis',
		['model'] = 'hellion',
		['price'] = 38000,
		['category'] = 'offroad',
		['hash'] = `hellion`,
		
	},
	['kalahari'] = {
		['name'] = 'Kalahari',
		['brand'] = 'Canis',
		['model'] = 'kalahari',
		['price'] = 14000,
		['category'] = 'offroad',
		['hash'] = `kalahari`,
		
	},
	['kamacho'] = {
		['name'] = 'Kamacho',
		['brand'] = 'Canis',
		['model'] = 'kamacho',
		['price'] = 50000,
		['category'] = 'offroad',
		['hash'] = `kamacho`,
		
	},
	['mesa3'] = {
		['name'] = 'Mesa Merryweather',
		['brand'] = 'Canis',
		['model'] = 'mesa3',
		['price'] = 400000,
		['category'] = 'offroad',
		['hash'] = `mesa3`,
		
	},
	['outlaw'] = {
		['name'] = 'Outlaw',
		['brand'] = 'Nagasaki',
		['model'] = 'outlaw',
		['price'] = 15000,
		['category'] = 'offroad',
		['hash'] = `outlaw`,
		
	},
	['rancherxl'] = {
		['name'] = 'Rancher XL',
		['brand'] = 'Declasse',
		['model'] = 'rancherxl',
		['price'] = 24000,
		['category'] = 'offroad',
		['hash'] = `rancherxl`,
		
	},
	['rebel2'] = {
		['name'] = 'Rebel',
		['brand'] = 'Annis',
		['model'] = 'rebel2',
		['price'] = 20000,
		['category'] = 'offroad',
		['hash'] = `rebel2`,
		
	},
	['riata'] = {
		['name'] = 'Riata',
		['brand'] = 'Vapid',
		['model'] = 'riata',
		['price'] = 380000,
		['category'] = 'offroad',
		['hash'] = `riata`,
		
	},
	['sandking'] = {
		['name'] = 'Sandking',
		['brand'] = 'Annis',
		['price'] = 25000,
		['category'] = 'offroad',
		['model'] = 'sandking',
		['hash'] = `sandking`,
		
	},
	['sandking2'] = {
		['name'] = 'Sandking SWB',
		['brand'] = 'Annis',
		['price'] = 38000,
		['category'] = 'offroad',
		['model'] = 'sandking2',
		['hash'] = `sandking2`,
		
	},
	['trophytruck'] = {
		['name'] = 'Trophy Truck',
		['brand'] = 'Annis',
		['price'] = 60000,
		['category'] = 'offroad',
		['model'] = 'trophytruck',
		['hash'] = `trophytruck`,
		
	},
	['trophytruck2'] = {
		['name'] = 'Trophy Truck Limited',
		['brand'] = 'Annis',
		['price'] = 80000,
		['category'] = 'offroad',
		['model'] = 'trophytruck2',
		['hash'] = `trophytruck2`,
		
	},
	['vagrant'] = {
		['name'] = 'Vagrant',
		['brand'] = 'Maxwell',
		['price'] = 50000,
		['category'] = 'offroad',
		['model'] = 'vagrant',
		['hash'] = `vagrant`,
		
	},
	['verus'] = {
		['name'] = 'Verus',
		['brand'] = 'Dinka',
		['price'] = 20000,
		['category'] = 'offroad',
		['model'] = 'verus',
		['hash'] = `verus`,
		
	},
	['winky'] = {
		['name'] = 'Winky',
		['brand'] = 'Vapid',
		['price'] = 10000,
		['category'] = 'offroad',
		['model'] = 'winky',
		['hash'] = `winky`,
		
	},
	--- SUVs
	['baller'] = {
		['name'] = 'Baller',
		['brand'] = 'Gallivanter',
		['model'] = 'baller',
		['price'] = 22000,
		['category'] = 'suvs',
		['hash'] = `baller`,
		
	},
	['baller2'] = {
		['name'] = 'Baller',
		['brand'] = 'Gallivanter',
		['model'] = 'baller2',
		['price'] = 15000,
		['category'] = 'suvs',
		['hash'] = `baller2`,
		
	},
	['baller3'] = {
		['name'] = 'Baller LE',
		['brand'] = 'Gallivanter',
		['model'] = 'baller3',
		['price'] = 15000,
		['category'] = 'suvs',
		['hash'] = `baller3`,
		
	},
	['baller4'] = {
		['name'] = 'Baller LE LWB',
		['brand'] = 'Gallivanter',
		['model'] = 'baller4',
		['price'] = 29000,
		['category'] = 'suvs',
		['hash'] = `baller4`,
		
	},
	['baller5'] = {
		['name'] = 'Baller LE (Armored)',
		['brand'] = 'Gallivanter',
		['model'] = 'baller5',
		['price'] = 78000,
		['category'] = 'suvs',
		['hash'] = `baller5`,
		
	},
	['baller6'] = {
		['name'] = 'Baller LE LWB (Armored)',
		['brand'] = 'Gallivanter',
		['model'] = 'baller6',
		['price'] = 82000,
		['category'] = 'suvs',
		['hash'] = `baller6`,
		
	},
	['bjxl'] = {
		['name'] = 'BeeJay XL',
		['brand'] = 'Karin',
		['model'] = 'bjxl',
		['price'] = 19000,
		['category'] = 'suvs',
		['hash'] = `bjxl`,
		
	},
	['cavalcade'] = {
		['name'] = 'Cavalcade',
		['brand'] = 'Albany',
		['model'] = 'cavalcade',
		['price'] = 14000,
		['category'] = 'suvs',
		['hash'] = `cavalcade`,
		
	},
	['cavalcade2'] = {
		['name'] = 'Cavalcade',
		['brand'] = 'Albany',
		['model'] = 'cavalcade2',
		['price'] = 16500,
		['category'] = 'suvs',
		['hash'] = `cavalcade2`,
		
	},
	['contender'] = {
		['name'] = 'Contender',
		['brand'] = 'Vapid',
		['model'] = 'contender',
		['price'] = 35000,
		['category'] = 'suvs',
		['hash'] = `contender`,
		
	},
	['dubsta'] = {
		['name'] = 'Dubsta',
		['brand'] = 'Benefactor',
		['model'] = 'dubsta',
		['price'] = 19000,
		['category'] = 'suvs',
		['hash'] = `dubsta`,
		
	},
	['dubsta2'] = {
		['name'] = 'Dubsta Luxuary',
		['brand'] = 'Benefactor',
		['model'] = 'dubsta2',
		['price'] = 19500,
		['category'] = 'suvs',
		['hash'] = `dubsta2`,
		
	},
	['fq2'] = {
		['name'] = 'FQ2',
		['brand'] = 'Fathom',
		['model'] = 'fq2',
		['price'] = 18500,
		['category'] = 'suvs',
		['hash'] = `fq2`,
		
	},
	['granger'] = {
		['name'] = 'Granger',
		['brand'] = 'Declasse',
		['model'] = 'granger',
		['price'] = 22000,
		['category'] = 'suvs',
		['hash'] = `granger`,
		
	},
	['gresley'] = {
		['name'] = 'Gresley',
		['brand'] = 'Bravado',
		['model'] = 'gresley',
		['price'] = 25000,
		['category'] = 'suvs',
		['hash'] = `gresley`,
		
	},
	['habanero'] = {
		['name'] = 'Habanero',
		['brand'] = 'Emperor',
		['model'] = 'habanero',
		['price'] = 20000,
		['category'] = 'suvs',
		['hash'] = `habanero`,
		
	},
	['huntley'] = {
		['name'] = 'Huntley S',
		['brand'] = 'Enus',
		['model'] = 'huntley',
		['price'] = 24500,
		['category'] = 'suvs',
		['hash'] = `huntley`,
		
	},
	['landstalker'] = {
		['name'] = 'Landstalker',
		['brand'] = 'Dundreary',
		['model'] = 'landstalker',
		['price'] = 12000,
		['category'] = 'suvs',
		['hash'] = `landstalker`,
		
	},
	['landstalker2'] = {
		['name'] = 'Landstalker XL',
		['brand'] = 'Dundreary',
		['model'] = 'landstalker2',
		['price'] = 26000,
		['category'] = 'suvs',
		['hash'] = `landstalker2`,
		
	},
	['mesa'] = {
		['name'] = 'Mesa',
		['brand'] = 'Canis',
		['model'] = 'mesa',
		['price'] = 12000,
		['category'] = 'offroad',
		['hash'] = `mesa`,
		
	},
	['novak'] = {							--DLC
		['name'] = 'Novak',
		['brand'] = 'Lampadati',
		['model'] = 'novak',
		['price'] = 70000,
		['category'] = 'suvs',
		['hash'] = `novak`,
		
	},
	['patriot'] = {
		['name'] = 'Patriot',
		['brand'] = 'Mammoth',
		['model'] = 'patriot',
		['price'] = 21000,
		['category'] = 'suvs',
		['hash'] = `patriot`,
		
	},
	['radi'] = {
		['name'] = 'Radius',
		['brand'] = 'Vapid',
		['model'] = 'radi',
		['price'] = 18000,
		['category'] = 'suvs',
		['hash'] = `radi`,
		
	},
	['rebla'] = {
		['name'] = 'Rebla GTS',
		['brand'] = 'Übermacht',
		['model'] = 'rebla',
		['price'] = 21000,
		['category'] = 'suvs',
		['hash'] = `rebla`,
		
	},
	['rocoto'] = {
		['name'] = 'Rocoto',
		['brand'] = 'Obey',
		['model'] = 'rocoto',
		['price'] = 13000,
		['category'] = 'suvs',
		['hash'] = `rocoto`,
		
	},
	['seminole'] = {
		['name'] = 'Seminole',
		['brand'] = 'Canis',
		['model'] = 'seminole',
		['price'] = 20000,
		['category'] = 'suvs',
		['hash'] = `seminole`,
		
	},
	['seminole2'] = {
		['name'] = 'Seminole Frontier',
		['brand'] = 'Canis',
		['model'] = 'seminole2',
		['price'] = 13000,
		['category'] = 'suvs',
		['hash'] = `seminole2`,
		
	},
	['serrano'] = {
		['name'] = 'Serrano',
		['brand'] = 'Benefactor',
		['model'] = 'serrano',
		['price'] = 48000,
		['category'] = 'suvs',
		['hash'] = `serrano`,
		
	},
	['toros'] = {							--DLC
		['name'] = 'Toros',
		['brand'] = 'Pegassi',
		['model'] = 'toros',
		['price'] = 65000,
		['category'] = 'suvs',
		['hash'] = `toros`,
		
	},
	['xls'] = {
		['name'] = 'XLS',
		['brand'] = 'Benefactor',
		['model'] = 'xls',
		['price'] = 17000,
		['category'] = 'suvs',
		['hash'] = `xls`,
		
	},
	['granger2'] = { 	 	--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Granger 3600LX',
		['brand'] = 'Declasse',
		['model'] = 'granger2',
		['price'] = 221000,
		['category'] = 'suvs',
		['hash'] = `granger2`,
		
	},
	--- Sedans
	['asea'] = {
		['name'] = 'Asea',
		['brand'] = 'Declasse',
		['model'] = 'asea',
		['price'] = 2500,
		['category'] = 'sedans',
		['hash'] = `asea`,
		
	},
	['asterope'] = {
		['name'] = 'Asterope',
		['brand'] = 'Karin',
		['model'] = 'asterope',
		['price'] = 11000,
		['category'] = 'sedans',
		['hash'] = `asterope`,
		
	},
	['cog55'] = {
		['name'] = 'Cognoscenti 55',
		['brand'] = 'Enus',
		['model'] = 'cog55',
		['price'] = 22000,
		['category'] = 'sedans',
		['hash'] = `cog55`,
		
	},
	['cognoscenti'] = {
		['name'] = 'Cognoscenti',
		['brand'] = 'Enus',
		['model'] = 'cognoscenti',
		['price'] = 22500,
		['category'] = 'sedans',
		['hash'] = `cognoscenti`,
		
	},
	['emperor'] = {
		['name'] = 'Emperor',
		['brand'] = 'Albany',
		['model'] = 'emperor',
		['price'] = 4250,
		['category'] = 'sedans',
		['hash'] = `emperor`,
		
	},
	['fugitive'] = {
		['name'] = 'Fugitive',
		['brand'] = 'Cheval',
		['model'] = 'fugitive',
		['price'] = 20000,
		['category'] = 'sedans',
		['hash'] = `fugitive`,
		
	},
	['glendale'] = {
		['name'] = 'Glendale',
		['brand'] = 'Benefactor',
		['model'] = 'glendale',
		['price'] = 3400,
		['category'] = 'sedans',
		['hash'] = `glendale`,
		
	},
	['glendale2'] = {
		['name'] = 'Glendale',
		['brand'] = 'Benefactor',
		['model'] = 'glendale2',
		['price'] = 12000,
		['category'] = 'sedans',
		['hash'] = `glendale2`,
		
	},
	['ingot'] = {
		['name'] = 'Ingot',
		['brand'] = 'Vulcar',
		['model'] = 'ingot',
		['price'] = 4999,
		['category'] = 'sedans',
		['hash'] = `ingot`,
		
	},
	['intruder'] = {
		['name'] = 'Intruder',
		['brand'] = 'Karin',
		['model'] = 'intruder',
		['price'] = 11250,
		['category'] = 'sedans',
		['hash'] = `intruder`,
		
	},
	['premier'] = {
		['name'] = 'Premier',
		['brand'] = 'Declasse',
		['model'] = 'premier',
		['price'] = 12000,
		['category'] = 'sedans',
		['hash'] = `premier`,
		
	},
	['primo'] = {
		['name'] = 'Primo',
		['brand'] = 'Albany',
		['model'] = 'primo',
		['price'] = 5000,
		['category'] = 'sedans',
		['hash'] = `primo`,
		
	},
	['primo2'] = {
		['name'] = 'Primo Custom',
		['brand'] = 'Albany',
		['model'] = 'primo2',
		['price'] = 14500,
		['category'] = 'sedans',
		['hash'] = `primo2`,
		
	},
	['regina'] = {
		['name'] = 'Regina',
		['brand'] = 'Dundreary',
		['model'] = 'regina',
		['price'] = 7000,
		['category'] = 'sedans',
		['hash'] = `regina`,
		
	},
	['stafford'] = {							--DLC
		['name'] = 'Stafford',
		['brand'] = 'Enus',
		['model'] = 'stafford',
		['price'] = 30000,
		['category'] = 'sedans',
		['hash'] = `stafford`,
		
	},
	['stanier'] = {
		['name'] = 'Stanier',
		['brand'] = 'Vapid',
		['model'] = 'stanier',
		['price'] = 19000,
		['category'] = 'sedans',
		['hash'] = `stanier`,
		
	},
	['stratum'] = {
		['name'] = 'Stratum',
		['brand'] = 'Zirconium',
		['model'] = 'stratum',
		['price'] = 15000,
		['category'] = 'sedans',
		['hash'] = `stratum`,
		
	},
	['stretch'] = {
		['name'] = 'Stretch',
		['brand'] = 'Dundreary',
		['model'] = 'stretch',
		['price'] = 19000,
		['category'] = 'sedans',
		['hash'] = `stretch`,
		
	},
	['superd'] = {
		['name'] = 'Super Diamond',
		['brand'] = 'Enus',
		['model'] = 'superd',
		['price'] = 17000,
		['category'] = 'sedans',
		['hash'] = `superd`,
		
	},
	['surge'] = {
		['name'] = 'Surge',
		['brand'] = 'Cheval',
		['model'] = 'surge',
		['price'] = 20000,
		['category'] = 'sedans',
		['hash'] = `surge`,
		
	},
	['tailgater'] = {
		['name'] = 'Tailgater',
		['brand'] = 'Obey',
		['model'] = 'tailgater',
		['price'] = 22000,
		['category'] = 'sedans',
		['hash'] = `tailgater`,
		
	},
	['warrener'] = {
		['name'] = 'Warrener',
		['brand'] = 'Vulcar',
		['model'] = 'warrener',
		['price'] = 4000,
		['category'] = 'sedans',
		['hash'] = `warrener`,
		
	},
	['washington'] = {
		['name'] = 'Washington',
		['brand'] = 'Albany',
		['model'] = 'washington',
		['price'] = 7000,
		['category'] = 'sedans',
		['hash'] = `washington`,
		
	},
	['tailgater2'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Tailgater S',
		['brand'] = 'Obey',
		['model'] = 'tailgater2',
		['price'] = 51000,
		['category'] = 'sedans',
		['hash'] = `tailgater2`,
		
	},
	['cinquemila'] = { 	 	--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Lampadati',
		['brand'] = 'Cinquemila',
		['model'] = 'cinquemila',
		['price'] = 125000,
		['category'] = 'sedans',
		['hash'] = `cinquemila`,
		
	},
	['iwagen'] = { 	 	--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Obey',
		['brand'] = 'I-Wagen',
		['model'] = 'iwagen',
		['price'] = 225000,
		['category'] = 'sedans',
		['hash'] = `iwagen`,
		
	},
	['astron'] = { 	 	--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Pfister',
		['brand'] = 'Astron',
		['model'] = 'astron',
		['price'] = 150000,
		['category'] = 'sedans',
		['hash'] = `astron`,
		
	},
	['baller7'] = { 	 	--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Baller ST',
		['brand'] = 'Gallivanter',
		['model'] = 'baller7',
		['price'] = 145000,
		['category'] = 'sedans',
		['hash'] = `baller7`,
		
	},
	['comet7'] = { 	 	--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Comet',
		['brand'] = 'S2 Cabrio',
		['model'] = 'comet7',
		['price'] = 25000,
		['category'] = 'sedans',
		['hash'] = `comet7`,
		
	},
	['deity'] = { 	 	--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Deity',
		['brand'] = 'Enus',
		['model'] = 'deity',
		['price'] = 505000,
		['category'] = 'sedans',
		['hash'] = `deity`,
		
	},
	['jubilee'] = { 	 	--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Jubilee',
		['brand'] = 'Enus',
		['model'] = 'jubilee',
		['price'] = 485000,
		['category'] = 'sedans',
		['hash'] = `jubilee`,
		
	},
	['patriot3'] = { 	 	--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Patriot',
		['brand'] = 'Mil-Spec',
		['model'] = 'patriot3',
		['price'] = 270000,
		['category'] = 'sedans',
		['hash'] = `patriot3`,
		
	},
	--- Sports
	['alpha'] = {
		['name'] = 'Alpha',
		['brand'] = 'Albany',
		['model'] = 'alpha',
		['price'] = 53000,
		['category'] = 'sports',
		['hash'] = `alpha`,
		['shop'] = 'luxury',
	},
	['banshee'] = {
		['name'] = 'Banshee',
		['brand'] = 'Bravado',
		['model'] = 'banshee',
		['price'] = 56000,
		['category'] = 'sports',
		['hash'] = `banshee`,
		['shop'] = 'luxury',
	},
	['bestiagts'] = {
		['name'] = 'Bestia GTS',
		['brand'] = 'Grotti',
		['model'] = 'bestiagts',
		['price'] = 37000,
		['category'] = 'sports',
		['hash'] = `bestiagts`,
		['shop'] = 'luxury',
	},
	['blista2'] = {
		['name'] = 'Blista Compact',
		['brand'] = 'Dinka',
		['model'] = 'blista2',
		['price'] = 18950,
		['category'] = 'compacts',
		['hash'] = `blista2`,
		
	},
	['blista3'] = {
		['name'] = 'Blista Go Go Monkey',
		['brand'] = 'Dinka',
		['model'] = 'blista3',
		['price'] = 15000,
		['category'] = 'compacts',
		['hash'] = `blista3`,
		
	},
	['buffalo'] = {
		['name'] = 'Buffalo',
		['brand'] = 'Bravado',
		['model'] = 'buffalo',
		['price'] = 18750,
		['category'] = 'sports',
		['hash'] = `buffalo`,
		['shop'] = 'luxury',
	},
	['buffalo2'] = {
		['name'] = 'Buffalo S',
		['brand'] = 'Bravado',
		['model'] = 'buffalo2',
		['price'] = 24500,
		['category'] = 'sports',
		['hash'] = `buffalo2`,
		['shop'] = 'luxury',
	},
	['carbonizzare'] = {
		['name'] = 'Carbonizzare',
		['brand'] = 'Grotti',
		['model'] = 'carbonizzare',
		['price'] = 155000,
		['category'] = 'sports',
		['hash'] = `carbonizzare`,
		['shop'] = 'luxury',
	},
	['comet2'] = {
		['name'] = 'Comet',
		['brand'] = 'Pfister',
		['model'] = 'comet2',
		['price'] = 130000,
		['category'] = 'sports',
		['hash'] = `comet2`,
		['shop'] = 'luxury',
	},
	['comet3'] = {
		['name'] = 'Comet Retro Custom',
		['brand'] = 'Pfister',
		['model'] = 'comet3',
		['price'] = 175000,
		['category'] = 'sports',
		['hash'] = `comet3`,
		['shop'] = 'luxury',
	},
	['comet4'] = {
		['name'] = 'Comet Safari',
		['brand'] = 'Pfister',
		['model'] = 'comet4',
		['price'] = 110000,
		['category'] = 'sports',
		['hash'] = `comet4`,
		['shop'] = 'luxury',
	},
	['comet5'] = {
		['name'] = 'Comet SR',
		['brand'] = 'Pfister',
		['model'] = 'comet5',
		['price'] = 155000,
		['category'] = 'sports',
		['hash'] = `comet5`,
		['shop'] = 'luxury',
	},
	['coquette'] = {
		['name'] = 'Coquette',
		['brand'] = 'Invetero',
		['model'] = 'coquette',
		['price'] = 145000,
		['category'] = 'sports',
		['hash'] = `coquette`,
		['shop'] = 'luxury',
	},
	['coquette2'] = {
		['name'] = 'Coquette Classic',
		['brand'] = 'Invetero',
		['model'] = 'coquette2',
		['price'] = 165000,
		['category'] = 'sportsclassics',
		['hash'] = `coquette2`,
		
	},
	['coquette4'] = {
		['name'] = 'Coquette D10',
		['brand'] = 'Invetero',
		['model'] = 'coquette4',
		['price'] = 220000,
		['category'] = 'sports',
		['hash'] = `coquette4`,
		['shop'] = 'luxury',
	},
	['drafter'] = {							--DLC
		['name'] = '8F Drafter',
		['brand'] = 'Obey',
		['model'] = 'drafter',
		['price'] = 80000,
		['category'] = 'sports',
		['hash'] = `drafter`,
		['shop'] = 'luxury',
	},
	['deveste'] = {							--DLC
		['name'] = 'Deveste',
		['brand'] = 'Principe',
		['model'] = 'deveste',
		['price'] = 234000,
		['category'] = 'super',
		['hash'] = `deveste`,
		['shop'] = 'luxury',
	},
	['elegy'] = {							--DLC
		['name'] = 'Elegy Retro Custom',
		['brand'] = 'Annis',
		['model'] = 'elegy',
		['price'] = 145000,
		['category'] = 'sports',
		['hash'] = `elegy`,
		['shop'] = 'luxury',
	},
	['elegy2'] = {
		['name'] = 'Elegy RH8',
		['brand'] = 'Annis',
		['model'] = 'elegy2',
		['price'] = 150000,
		['category'] = 'sports',
		['hash'] = `elegy2`,
		['shop'] = 'luxury',
	},
	['feltzer2'] = {
		['name'] = 'Feltzer',
		['brand'] = 'Benefactor',
		['model'] = 'feltzer2',
		['price'] = 97000,
		['category'] = 'sports',
		['hash'] = `feltzer2`,
		['shop'] = 'luxury',
	},
	['flashgt'] = {
		['name'] = 'Flash GT',
		['brand'] = 'Vapid',
		['model'] = 'flashgt',
		['price'] = 48000,
		['category'] = 'sports',
		['hash'] = `flashgt`,
		['shop'] = 'luxury',
	},
	['furoregt'] = {
		['name'] = 'Furore GT',
		['brand'] = 'Lampadati',
		['model'] = 'furoregt',
		['price'] = 78000,
		['category'] = 'sports',
		['hash'] = `furoregt`,
		['shop'] = 'luxury',
	},
	['futo'] = {
		['name'] = 'Futo',
		['brand'] = 'Karin',
		['model'] = 'futo',
		['price'] = 17500,
		['category'] = 'coupes',
		['hash'] = `futo`,
		
	},
	['gb200'] = {
		['name'] = 'GB 200',
		['brand'] = 'Vapid',
		['model'] = 'gb200',
		['price'] = 140000,
		['category'] = 'sports',
		['hash'] = `gb200`,
		['shop'] = 'luxury',
	},
	['komoda'] = {
		['name'] = 'Komoda',
		['brand'] = 'Lampadati',
		['model'] = 'komoda',
		['price'] = 55000,
		['category'] = 'sports',
		['hash'] = `komoda`,
		['shop'] = 'luxury',
	},
	['imorgon'] = {
		['name'] = 'Imorgon',
		['brand'] = 'Overflod',
		['model'] = 'imorgon',
		['price'] = 120000,
		['category'] = 'sports',
		['hash'] = `imorgon`,
		['shop'] = 'luxury',
	},
	['issi7'] = {							--DLC
		['name'] = 'Issi Sport',
		['brand'] = 'Weeny',
		['model'] = 'issi7',
		['price'] = 100000,
		['category'] = 'compacts',
		['hash'] = `issi7`,
		
	},
	['italigto'] = {							--DLC
		['name'] = 'Itali GTO',
		['brand'] = 'Progen',
		['model'] = 'italigto',
		['price'] = 260000,
		['category'] = 'sports',
		['hash'] = `italigto`,
		['shop'] = 'luxury',
	},
	['jugular'] = {							--DLC
		['name'] = 'Jugular',
		['brand'] = 'Ocelot',
		['model'] = 'jugular',
		['price'] = 80000,
		['category'] = 'sports',
		['hash'] = `jugular`,
		['shop'] = 'luxury',
	},
	['jester'] = {
		['name'] = 'Jester',
		['brand'] = 'Dinka',
		['model'] = 'jester',
		['price'] = 132250,
		['category'] = 'sports',
		['hash'] = `jester`,
		['shop'] = 'luxury',
	},
	['jester2'] = {
		['name'] = 'Jester Racecar',
		['brand'] = 'Dinka',
		['model'] = 'jester2',
		['price'] = 210000,
		['category'] = 'sports',
		['hash'] = `jester2`,
		['shop'] = 'luxury',
	},
	['jester3'] = {
		['name'] = 'Jester Classic',
		['brand'] = 'Dinka',
		['model'] = 'jester3',
		['price'] = 85000,
		['category'] = 'sports',
		['hash'] = `jester3`,
		['shop'] = 'luxury',
	},
	['khamelion'] = {
		['name'] = 'Khamelion',
		['brand'] = 'Hijak',
		['model'] = 'khamelion',
		['price'] = 90000,
		['category'] = 'sports',
		['hash'] = `khamelion`,
		['shop'] = 'luxury',
	},
	['kuruma'] = {
		['name'] = 'Kuruma',
		['brand'] = 'Karin',
		['model'] = 'kuruma',
		['price'] = 72000,
		['category'] = 'sports',
		['hash'] = `kuruma`,
		['shop'] = 'luxury',
	},
	['kuruma2'] = {
		['name'] = 'kuruma2',
		['brand'] = 'Karin2',
		['model'] = 'kuruma2',
		['price'] = 72000,
		['category'] = 'sports',
		['hash'] = `kuruma2`,
		['shop'] = 'luxury',
	},
	['locust'] = {							--DLC
		['name'] = 'Locust',
		['brand'] = 'Ocelot',
		['model'] = 'locust',
		['price'] = 200000,
		['category'] = 'sports',
		['hash'] = `locust`,
		['shop'] = 'luxury',
	},
	['lynx'] = {
		['name'] = 'Lynx',
		['brand'] = 'Ocelot',
		['model'] = 'lynx',
		['price'] = 150000,
		['category'] = 'sports',
		['hash'] = `lynx`,
		['shop'] = 'luxury',
	},
	['massacro'] = {
		['name'] = 'Massacro',
		['brand'] = 'Dewbauchee',
		['model'] = 'massacro',
		['price'] = 110000,
		['category'] = 'sports',
		['hash'] = `massacro`,
		['shop'] = 'luxury',
	},
	['massacro2'] = {
		['name'] = 'Massacro Racecar',
		['brand'] = 'Dewbauchee',
		['model'] = 'massacro2',
		['price'] = 80000,
		['category'] = 'sports',
		['hash'] = `massacro2`,
		['shop'] = 'luxury',
	},
	['neo'] = {							--DLC
		['name'] = 'Neo',
		['brand'] = 'Vysser',
		['model'] = 'neo',
		['price'] = 230000,
		['category'] = 'sports',
		['hash'] = `neo`,
		['shop'] = 'luxury',
	},
	['neon'] = {							--DLC
		['name'] = 'Neon',
		['brand'] = 'Pfister',
		['model'] = 'neon',
		['price'] = 220000,
		['category'] = 'sports',
		['hash'] = `neon`,
		['shop'] = 'luxury',
	},
	['ninef'] = {
		['name'] = '9F',
		['brand'] = 'Obey',
		['model'] = 'ninef',
		['price'] = 95000,
		['category'] = 'sports',
		['hash'] = `ninef`,
		['shop'] = 'luxury',
	},
	['ninef2'] = {
		['name'] = '9F Cabrio',
		['brand'] = 'Obey',
		['model'] = 'ninef2',
		['price'] = 105000,
		['category'] = 'sports',
		['hash'] = `ninef2`,
		['shop'] = 'luxury',
	},
	['omnis'] = {
		['name'] = 'Omnis',
		['brand'] = 'Wow',
		['model'] = 'omnis',
		['price'] = 90000,
		['category'] = 'sports',
		['hash'] = `omnis`,
		['shop'] = 'luxury',
	},
	['paragon'] = {							--DLC
		['name'] = 'Paragon',
		['brand'] = 'Enus',
		['model'] = 'paragon',
		['price'] = 60000,
		['category'] = 'sports',
		['hash'] = `paragon`,
		['shop'] = 'luxury',
	},
	['pariah'] = {
		['name'] = 'Pariah',
		['brand'] = 'Ocelot',
		['model'] = 'pariah',
		['price'] = 90000,
		['category'] = 'sports',
		['hash'] = `pariah`,
		['shop'] = 'luxury',
	},
	['penumbra'] = {
		['name'] = 'Penumbra',
		['brand'] = 'Maibatsu',
		['model'] = 'penumbra',
		['price'] = 22000,
		['category'] = 'sports',
		['hash'] = `penumbra`,
		['shop'] = 'luxury',
	},
	['penumbra2'] = {
		['name'] = 'Penumbra FF',
		['brand'] = 'Maibatsu',
		['model'] = 'penumbra2',
		['price'] = 30000,
		['category'] = 'sports',
		['hash'] = `penumbra2`,
		['shop'] = 'luxury',
	},
	['rapidgt'] = {
		['name'] = 'Rapid GT',
		['brand'] = 'Dewbauchee',
		['model'] = 'rapidgt',
		['price'] = 86000,
		['category'] = 'sports',
		['hash'] = `rapidgt`,
		['shop'] = 'luxury',
	},
	['rapidgt2'] = {
		['name'] = 'Rapid GT Convertible',
		['brand'] = 'Dewbauchee',
		['model'] = 'rapidgt2',
		['price'] = 92000,
		['category'] = 'sports',
		['hash'] = `rapidgt2`,
		['shop'] = 'luxury',
	},
	['raptor'] = {
		['name'] = 'Raptor',
		['brand'] = 'BF',
		['model'] = 'raptor',
		['price'] = 90000,
		['category'] = 'sports',
		['hash'] = `raptor`,
		['shop'] = 'luxury',
	},
	['revolter'] = {
		['name'] = 'Revolter',
		['brand'] = 'Ubermacht',
		['model'] = 'revolter',
		['price'] = 95000,
		['category'] = 'sports',
		['hash'] = `revolter`,
		['shop'] = 'luxury',
	},
	['ruston'] = {
		['name'] = 'Ruston',
		['brand'] = 'Hijak',
		['model'] = 'ruston',
		['price'] = 130000,
		['category'] = 'sports',
		['hash'] = `ruston`,
		['shop'] = 'luxury',
	},
	['schafter2'] = {
		['name'] = 'Schafter',
		['brand'] = 'Benefactor',
		['model'] = 'schafter2',
		['price'] = 16000,
		['category'] = 'sedans',
		['hash'] = `schafter2`,
		
	},
	['schafter3'] = {
		['name'] = 'Schafter V12',
		['brand'] = 'Benefactor',
		['model'] = 'schafter3',
		['price'] = 35000,
		['category'] = 'sports',
		['hash'] = `schafter3`,
		['shop'] = 'luxury',
	},
	['schafter4'] = {
		['name'] = 'Schafter LWB',
		['brand'] = 'Benefactor',
		['model'] = 'schafter4',
		['price'] = 21000,
		['category'] = 'sports',
		['hash'] = `schafter4`,
		['shop'] = 'luxury',
	},
	['schlagen'] = {							--DLC
		['name'] = 'Schlagen GT',
		['brand'] = 'Benefactor',
		['model'] = 'schlagen',
		['price'] = 160000,
		['category'] = 'sports',
		['hash'] = `schlagen`,
		['shop'] = 'luxury',
	},
	['schwarzer'] = {
		['name'] = 'Schwartzer',
		['brand'] = 'Benefactor',
		['model'] = 'schwarzer',
		['price'] = 47000,
		['category'] = 'sports',
		['hash'] = `schwarzer`,
		['shop'] = 'luxury',
	},
	['sentinel3'] = {
		['name'] = 'Sentinel Classic',
		['brand'] = 'Übermacht',
		['model'] = 'sentinel3',
		['price'] = 70000,
		['category'] = 'coupes',
		['hash'] = `sentinel3`,
		
	},
	['seven70'] = {
		['name'] = 'Seven-70',
		['brand'] = 'Dewbauchee',
		['model'] = 'seven70',
		['price'] = 140000,
		['category'] = 'sports',
		['hash'] = `seven70`,
		['shop'] = 'luxury',
	},
	['specter'] = {
		['name'] = 'Specter',
		['brand'] = 'Dewbauchee',
		['model'] = 'specter',
		['price'] = 160000,
		['category'] = 'sports',
		['hash'] = `specter`,
		['shop'] = 'luxury',
	},
	['streiter'] = {
		['name'] = 'Streiter',
		['brand'] = 'Benefactor',
		['model'] = 'streiter',
		['price'] = 40000,
		['category'] = 'sports',
		['hash'] = `streiter`,
		['shop'] = 'luxury',
	},
	['sugoi'] = {
		['name'] = 'Sugoi',
		['brand'] = 'Dinka',
		['model'] = 'sugoi',
		['price'] = 85000,
		['category'] = 'sports',
		['hash'] = `sugoi`,
		['shop'] = 'luxury',
	},
	['sultan'] = {
		['name'] = 'Sultan',
		['brand'] = 'Karin',
		['model'] = 'sultan',
		['price'] = 50000,
		['category'] = 'sports',
		['hash'] = `sultan`,
		['shop'] = 'luxury',
	},
	['sultan2'] = {
		['name'] = 'Sultan Custom',
		['brand'] = 'Karin',
		['model'] = 'sultan2',
		['price'] = 55000,
		['category'] = 'sports',
		['hash'] = `sultan2`,
		['shop'] = 'luxury',
	},
	['surano'] = {
		['name'] = 'Surano',
		['brand'] = ' Benefactor',
		['model'] = 'surano',
		['price'] = 80000,
		['category'] = 'sports',
		['hash'] = `surano`,
		['shop'] = 'luxury',
	},
	['tampa2'] = {
		['name'] = 'Drift Tampa',
		['brand'] = 'Declasse',
		['model'] = 'tampa2',
		['price'] = 80000,
		['category'] = 'muscle',
		['hash'] = `tampa2`,
		
	},
	['tropos'] = {
		['name'] = 'Tropos Rallye',
		['brand'] = 'Lampadati',
		['model'] = 'tropos',
		['price'] = 65000,
		['category'] = 'sports',
		['hash'] = `tropos`,
		['shop'] = 'luxury',
	},
	['verlierer2'] = {
		['name'] = 'Verlierer',
		['brand'] = 'Bravado',
		['model'] = 'verlierer2',
		['price'] = 90500,
		['category'] = 'sports',
		['hash'] = `verlierer2`,
		['shop'] = 'luxury',
	},
	['vstr'] = {
		['name'] = 'V-STR',
		['brand'] = 'Albany',
		['model'] = 'vstr',
		['price'] = 80000,
		['category'] = 'sports',
		['hash'] = `vstr`,
		['shop'] = 'luxury',
	},
	['italirsx'] = {
		['name'] = 'Itali RSX',
		['brand'] = 'Progen',
		['model'] = 'italirsx',
		['price'] = 260000,
		['category'] = 'sports',
		['hash'] = `italirsx`,
		['shop'] = 'luxury',
	},
	['zr350'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'ZR350',
		['brand'] = 'Annis',
		['model'] = 'zr350',
		['price'] = 38000,
		['category'] = 'sports',
		['hash'] = `zr350`,
		['shop'] = 'luxury',
	},
	['calico'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Calico GTF',
		['brand'] = 'Karin',
		['model'] = 'calico',
		['price'] = 39000,
		['category'] = 'sports',
		['hash'] = `calico`,
		['shop'] = 'luxury',
	},
	['futo2'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Futo GTX',
		['brand'] = 'Karin',
		['model'] = 'futo2',
		['price'] = 39000,
		['category'] = 'sports',
		['hash'] = `futo2`,
		['shop'] = 'luxury',
	},
	['euros'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Euros',
		['brand'] = 'Annis',
		['model'] = 'euros',
		['price'] = 80000,
		['category'] = 'sports',
		['hash'] = `euros`,
		['shop'] = 'luxury',
	},
	['jester4'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Jester RR',
		['brand'] = 'Dinka',
		['model'] = 'jester4',
		['price'] = 240000,
		['category'] = 'sports',
		['hash'] = `jester4`,
		['shop'] = 'luxury',
	},
	['remus'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Remus',
		['brand'] = 'Annis',
		['model'] = 'remus',
		['price'] = 48000,
		['category'] = 'sports',
		['hash'] = `remus`,
		['shop'] = 'luxury',
	},
	['comet6'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Comet S2',
		['brand'] = 'Pfister',
		['model'] = 'comet6',
		['price'] = 230000,
		['category'] = 'sports',
		['hash'] = `comet6`,
		['shop'] = 'luxury',
	},
	['growler'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Growler',
		['brand'] = 'Pfister',
		['model'] = 'growler',
		['price'] = 205000,
		['category'] = 'sports',
		['hash'] = `growler`,
		['shop'] = 'luxury',
	},
	['vectre'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Emperor Vectre',
		['brand'] = 'Emperor',
		['model'] = 'vectre',
		['price'] = 80000,
		['category'] = 'sports',
		['hash'] = `vectre`,
		['shop'] = 'luxury',
	},
	['cypher'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Cypher',
		['brand'] = 'Ubermacht',
		['model'] = 'cypher',
		['price'] = 155000,
		['category'] = 'sports',
		['hash'] = `cypher`,
		['shop'] = 'luxury',
	},
	['sultan3'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Sultan Classic Custom',
		['brand'] = 'Karin',
		['model'] = 'sultan3',
		['price'] = 56000,
		['category'] = 'sports',
		['hash'] = `sultan3`,
		['shop'] = 'luxury',
	},
	['rt3000'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'RT3000',
		['brand'] = 'Dinka',
		['model'] = 'rt3000',
		['price'] = 65000,
		['category'] = 'sports',
		['hash'] = `rt3000`,
		['shop'] = 'luxury',
	},
	--- Sports Classic
	['ardent'] = {
		['name'] = 'Ardent',
		['brand'] = 'Ocelot',
		['model'] = 'ardent',
		['price'] = 30000,
		['category'] = 'sportsclassics',
		['hash'] = `ardent`,
		
	},
	['btype'] = {              --meme car that goes pretty fast
		['name'] = 'Roosevelt',
		['brand'] = 'Albany',
		['model'] = 'btype',
		['price'] = 75000,
		['category'] = 'sportsclassics',
		['hash'] = `btype`,
		
	},
	['btype2'] = {
		['name'] = 'Franken Stange',
		['brand'] = 'Albany',
		['model'] = 'btype2',
		['price'] = 87000,
		['category'] = 'sportsclassics',
		['hash'] = `btype2`,
		
	},
	['btype3'] = {
		['name'] = 'Roosevelt Valor',
		['brand'] = 'Albany',
		['model'] = 'btype3',
		['price'] = 63000,
		['category'] = 'sportsclassics',
		['hash'] = `btype3`,
		
	},
	['casco'] = {
		['name'] = 'Casco',
		['brand'] = 'Lampadati',
		['model'] = 'casco',
		['price'] = 100000,
		['category'] = 'sportsclassics',
		['hash'] = `casco`,
		
	},
	['cheetah2'] = {
		['name'] = 'Cheetah Classic',
		['brand'] = 'Grotti',
		['model'] = 'cheetah2',
		['price'] = 195000,
		['category'] = 'sports',
		['hash'] = `cheetah2`,
		['shop'] = 'luxury',
	},
	['deluxo'] = {
		['name'] = 'Deluxo',
		['brand'] = 'Imponte',
		['model'] = 'deluxo',
		['price'] = 55000,
		['category'] = 'sportsclassics',
		['hash'] = `deluxo`,
		
	},
	['dynasty'] = {							--DLC
		['name'] = 'Dynasty',
		['brand'] = 'Weeny',
		['model'] = 'dynasty',
		['price'] = 25000,
		['category'] = 'sportsclassics',
		['hash'] = `dynasty`,
		
	},
	['fagaloa'] = {
		['name'] = 'Fagaloa',
		['brand'] = 'Vulcar',
		['model'] = 'fagaloa',
		['price'] = 13000,
		['category'] = 'sportsclassics',
		['hash'] = `fagaloa`,
		
	},
	['feltzer3'] = {							--DLC
		['name'] = 'Stirling GT',
		['brand'] = 'Benefactor',
		['model'] = 'feltzer3',
		['price'] = 115000,
		['category'] = 'sportsclassics',
		['hash'] = `feltzer3`,
		
	},
	['gt500'] = {
		['name'] = 'GT500',
		['brand'] = 'Grotti',
		['model'] = 'gt500',
		['price'] = 130000,
		['category'] = 'sportsclassics',
		['hash'] = `gt500`,
		
	},
	['infernus2'] = {
		['name'] = 'Infernus Classic',
		['brand'] = 'Pegassi',
		['model'] = 'infernus2',
		['price'] = 245000,
		['category'] = 'sportsclassics',
		['hash'] = `infernus2`,
		
	},
	['jb700'] = {
		['name'] = 'JB 700',
		['brand'] = 'Dewbauchee',
		['model'] = 'jb700',
		['price'] = 240000,
		['category'] = 'sportsclassics',
		['hash'] = `jb700`,
		
	},
	['jb7002'] = {
		['name'] = 'JB 700W',
		['brand'] = 'Dewbauchee',
		['model'] = 'jb7002',
		['price'] = 40000,
		['category'] = 'sportsclassics',
		['hash'] = `jb7002`,
		
	},
	['mamba'] = {
		['name'] = 'Mamba',
		['brand'] = 'Declasse',
		['model'] = 'mamba',
		['price'] = 140000,
		['category'] = 'sportsclassics',
		['hash'] = `mamba`,
		
	},
	['manana'] = {
		['name'] = 'Manana',
		['brand'] = 'Albany',
		['model'] = 'manana',
		['price'] = 12800,
		['category'] = 'muscle',
		['hash'] = `manana`,
		
	},
	['manana2'] = {
		['name'] = 'Manana Custom',
		['brand'] = 'Albany',
		['model'] = 'manana2',
		['price'] = 24000,
		['category'] = 'muscle',
		['hash'] = `manana2`,
		
	},
	['michelli'] = {
		['name'] = 'Michelli GT',
		['brand'] = 'Lampadati',
		['model'] = 'michelli',
		['price'] = 30000,
		['category'] = 'sportsclassics',
		['hash'] = `michelli`,
		
	},
	['monroe'] = {
		['name'] = 'Monroe',
		['brand'] = 'Pegassi',
		['model'] = 'monroe',
		['price'] = 115000,
		['category'] = 'sportsclassics',
		['hash'] = `monroe`,
		
	},
	['nebula'] = {							--DLC
		['name'] = 'Nebula',
		['brand'] = 'Vulcar',
		['model'] = 'nebula',
		['price'] = 22000,
		['category'] = 'sportsclassics',
		['hash'] = `nebula`,
		
	},
	['peyote'] = {
		['name'] = 'Peyote',
		['brand'] = 'Vapid',
		['model'] = 'peyote',
		['price'] = 23500,
		['category'] = 'sportsclassics',
		['hash'] = `peyote`,
		
	},
	['peyote3'] = {
		['name'] = 'Peyote Custom',
		['brand'] = 'Vapid',
		['model'] = 'peyote3',
		['price'] = 48000,
		['category'] = 'sportsclassics',
		['hash'] = `peyote3`,
		
	},
	['pigalle'] = {
		['name'] = 'Pigalle',
		['brand'] = 'Lampadati',
		['model'] = 'pigalle',
		['price'] = 92000,
		['category'] = 'sportsclassics',
		['hash'] = `pigalle`,
		
	},
	['rapidgt3'] = {
		['name'] = 'Rapid GT',
		['brand'] = 'Dewbauchee',
		['model'] = 'rapidgt3',
		['price'] = 90000,
		['category'] = 'sportsclassics',
		['hash'] = `rapidgt3`,
		
	},
	['retinue'] = {
		['name'] = 'Retinue',
		['brand'] = 'Vapid',
		['model'] = 'retinue',
		['price'] = 32000,
		['category'] = 'sportsclassics',
		['hash'] = `retinue`,
		
	},
	['retinue2'] = {
		['name'] = 'Retinue MKII',
		['brand'] = 'Vapid',
		['model'] = 'retinue2',
		['price'] = 38000,
		['category'] = 'sportsclassics',
		['hash'] = `retinue2`,
		
	},
	['savestra'] = {
		['name'] = 'Savestra',
		['brand'] = 'Annis',
		['model'] = 'savestra',
		['price'] = 67000,
		['category'] = 'sportsclassics',
		['hash'] = `savestra`,
		
	},
	['stinger'] = {
		['name'] = 'Stinger',
		['brand'] = 'Grotti',
		['model'] = 'stinger',
		['price'] = 39500,
		['category'] = 'sportsclassics',
		['hash'] = `stinger`,
		
	},
	['stingergt'] = {
		['name'] = 'Stinger GT',
		['brand'] = 'Grotti',
		['model'] = 'stingergt',
		['price'] = 70000,
		['category'] = 'sportsclassics',
		['hash'] = `stingergt`,
		
	},
	['stromberg'] = {
		['name'] = 'Stromberg',
		['brand'] = 'Ocelot',
		['model'] = 'stromberg',
		['price'] = 80000,
		['category'] = 'sportsclassics',
		['hash'] = `stromberg`,
		
	},
	['swinger'] = {							--DLC
		['name'] = 'Swinger',
		['brand'] = 'Ocelot',
		['model'] = 'swinger',
		['price'] = 221000,
		['category'] = 'sportsclassics',
		['hash'] = `swinger`,
		
	},
	['torero'] = {
		['name'] = 'Torero',
		['brand'] = 'Pegassi',
		['model'] = 'torero',
		['price'] = 84000,
		['category'] = 'sportsclassics',
		['hash'] = `torero`,
		
	},
	['tornado'] = {
		['name'] = 'Tornado',
		['brand'] = 'Declasse',
		['model'] = 'tornado',
		['price'] = 21000,
		['category'] = 'sportsclassics',
		['hash'] = `tornado`,
		
	},
	['tornado2'] = {
		['name'] = 'Tornado Gang',
		['brand'] = 'Declasse',
		['model'] = 'tornado2',
		['price'] = 22000,
		['category'] = 'sportsclassics',
		['hash'] = `tornado2`,
		
	},
	['tornado5'] = {
		['name'] = 'Tornado Custom',
		['brand'] = 'Declasse',
		['model'] = 'tornado5',
		['price'] = 22000,
		['category'] = 'sportsclassics',
		['hash'] = `tornado5`,
		
	},
	['turismo2'] = {
		['name'] = 'Turismo Classic',
		['brand'] = 'Grotti',
		['model'] = 'turismo2',
		['price'] = 170000,
		['category'] = 'sportsclassics',
		['hash'] = `turismo2`,
		
	},
	['viseris'] = {
		['name'] = 'Viseris',
		['brand'] = 'Lampadati',
		['model'] = 'viseris',
		['price'] = 210000,
		['category'] = 'sportsclassics',
		['hash'] = `viseris`,
		
	},
	['z190'] = {
		['name'] = '190Z',
		['brand'] = 'Karin',
		['model'] = 'z190',
		['price'] = 78000,
		['category'] = 'sportsclassics',
		['hash'] = `z190`,
		
	},
	['ztype'] = {
		['name'] = 'Z-Type',
		['brand'] = 'Truffade',
		['model'] = 'ztype',
		['price'] = 270000,
		['category'] = 'sportsclassics',
		['hash'] = `ztype`,
		
	},
	['zion3'] = {							--DLC
		['name'] = 'Zion Classic',
		['brand'] = 'Übermacht',
		['model'] = 'zion3',
		['price'] = 45000,
		['category'] = 'sportsclassics',
		['hash'] = `zion3`,
		
	},
	['cheburek'] = {
		['name'] = 'Cheburek',
		['brand'] = 'Rune',
		['model'] = 'cheburek',
		['price'] = 7000,
		['category'] = 'sportsclassics',
		['hash'] = `cheburek`,
		
	},
	['toreador'] = {
		['name'] = 'Toreador',
		['brand'] = 'Pegassi',
		['model'] = 'toreador',
		['price'] = 50000,
		['category'] = 'sportsclassics',
		['hash'] = `toreador`,
		
	},
	--- Super
	['adder'] = {
		['name'] = 'Adder',
		['brand'] = 'Truffade',
		['model'] = 'adder',
		['price'] = 280000,
		['category'] = 'super',
		['hash'] = `adder`,
		['shop'] = 'luxury',
	},
	['autarch'] = {
		['name'] = 'Autarch',
		['brand'] = 'Överflöd',
		['model'] = 'autarch',
		['price'] = 224000,
		['category'] = 'super',
		['hash'] = `autarch`,
		['shop'] = 'luxury',
	},
	['banshee2'] = {
		['name'] = 'Banshee 900R',
		['brand'] = 'Bravado',
		['model'] = 'banshee2',
		['price'] = 120000,
		['category'] = 'super',
		['hash'] = `banshee2`,
		['shop'] = 'luxury',
	},
	['bullet'] = {
		['name'] = 'Bullet',
		['brand'] = 'Vapid',
		['model'] = 'bullet',
		['price'] = 120000,
		['category'] = 'super',
		['hash'] = `bullet`,
		['shop'] = 'luxury',
	},
	['cheetah'] = {
		['name'] = 'Cheetah',
		['brand'] = 'Grotti',
		['model'] = 'cheetah',
		['price'] = 214000,
		['category'] = 'super',
		['hash'] = `cheetah`,
		['shop'] = 'luxury',
	},
	['cyclone'] = {         --might be too overpowered
		['name'] = 'Cyclone',
		['brand'] = 'Coil',
		['model'] = 'cyclone',
		['price'] = 300000,
		['category'] = 'super',
		['hash'] = `cyclone`,
		['shop'] = 'luxury',
	},
	['entity2'] = {
		['name'] = 'Entity XXR',
		['brand'] = 'Överflöd',
		['model'] = 'entity2',
		['price'] = 164000,
		['category'] = 'super',
		['hash'] = `entity2`,
		['shop'] = 'luxury',
	},
	['entityxf'] = {
		['name'] = 'Entity XF',
		['brand'] = 'Överflöd',
		['model'] = 'entityxf',
		['price'] = 180000,
		['category'] = 'super',
		['hash'] = `entityxf`,
		['shop'] = 'luxury',
	},
	['emerus'] = {							--DLC
		['name'] = 'Emerus',
		['brand'] = 'Progen',
		['model'] = 'emerus',
		['price'] = 220000,
		['category'] = 'super',
		['hash'] = `emerus`,
		['shop'] = 'luxury',
	},
	['fmj'] = {
		['name'] = 'FMJ',
		['brand'] = 'Vapid',
		['model'] = 'fmj',
		['price'] = 125000,
		['category'] = 'super',
		['hash'] = `fmj`,
		['shop'] = 'luxury',
	},
	['furia'] = {
		['name'] = 'Furia',
		['brand'] = 'Grotti',
		['model'] = 'furia',
		['price'] = 230000,
		['category'] = 'super',
		['hash'] = `furia`,
		['shop'] = 'luxury',
	},
	['gp1'] = {
		['name'] = 'GP1',
		['brand'] = 'Progen',
		['model'] = 'gp1',
		['price'] = 110000,
		['category'] = 'super',
		['hash'] = `gp1`,
		['shop'] = 'luxury',
	},
	['infernus'] = {
		['name'] = 'Infernus',
		['brand'] = 'Pegassi',
		['model'] = 'infernus',
		['price'] = 235000,
		['category'] = 'super',
		['hash'] = `infernus`,
		['shop'] = 'luxury',
	},
	['italigtb'] = {
		['name'] = 'Itali GTB',
		['brand'] = 'Progen',
		['model'] = 'italigtb',
		['price'] = 170000,
		['category'] = 'super',
		['hash'] = `italigtb`,
		['shop'] = 'luxury',
	},
	['italigtb2'] = {
		['name'] = 'Itali GTB',
		['brand'] = 'Progen',
		['model'] = 'italigtb2',
		['price'] = 250000,
		['category'] = 'super',
		['hash'] = `italigtb2`,
		['shop'] = 'luxury',
	},
	['krieger'] = {							--DLC
		['name'] = 'Krieger',
		['brand'] = 'Benefactor',
		['model'] = 'krieger',
		['price'] = 222000,
		['category'] = 'super',
		['hash'] = `krieger`,
		['shop'] = 'luxury',
	},
	['le7b'] = {
		['name'] = 'RE-7B',
		['brand'] = 'Annis',
		['model'] = 'le7b',
		['price'] = 260000,
		['category'] = 'super',
		['hash'] = `le7b`,
		['shop'] = 'luxury',
	},
	['nero'] = {
		['name'] = 'Nero',
		['brand'] = 'Truffade',
		['model'] = 'nero',
		['price'] = 200000,
		['category'] = 'super',
		['hash'] = `nero`,
		['shop'] = 'luxury',
	},
	['nero2'] = {
		['name'] = 'Nero Custom',
		['brand'] = 'Truffade',
		['model'] = 'nero2',
		['price'] = 260000,
		['category'] = 'super',
		['hash'] = `nero2`,
		['shop'] = 'luxury',
	},
	['osiris'] = {
		['name'] = 'Osiris',
		['brand'] = 'Pegassi',
		['model'] = 'osiris',
		['price'] = 220000,
		['category'] = 'super',
		['hash'] = `osiris`,
		['shop'] = 'luxury',
	},
	['penetrator'] = {
		['name'] = 'Penetrator',
		['brand'] = 'Ocelot',
		['model'] = 'penetrator',
		['price'] = 130000,
		['category'] = 'super',
		['hash'] = `penetrator`,
		['shop'] = 'luxury',
	},
	['pfister811'] = {
		['name'] = '811',
		['brand'] = 'Pfister',
		['model'] = 'pfister811',
		['price'] = 220000,
		['category'] = 'super',
		['hash'] = `pfister811`,
		['shop'] = 'luxury',
	},
	['prototipo'] = {
		['name'] = 'X80 Proto',
		['brand'] = 'Grotti',
		['model'] = 'prototipo',
		['price'] = 235000,
		['category'] = 'super',
		['hash'] = `prototipo`,
		['shop'] = 'luxury',
	},
	['reaper'] = {
		['name'] = 'Reaper',
		['brand'] = 'Pegassi',
		['model'] = 'reaper',
		['price'] = 100000,
		['category'] = 'super',
		['hash'] = `reaper`,
		['shop'] = 'luxury',
	},
	['s80'] = {							--DLC
		['name'] = 'S80RR',
		['brand'] = 'Annis',
		['model'] = 's80',
		['price'] = 205000,
		['category'] = 'super',
		['hash'] = `s80`,
		['shop'] = 'luxury',
	},
	['sc1'] = {
		['name'] = 'SC1',
		['brand'] = 'Übermacht',
		['model'] = 'sc1',
		['price'] = 90000,
		['category'] = 'super',
		['hash'] = `sc1`,
		['shop'] = 'luxury',
	},
	['sheava'] = {							--DLC
		['name'] = 'ETR1',
		['brand'] = 'Emperor',
		['model'] = 'sheava',
		['price'] = 220000,
		['category'] = 'super',
		['hash'] = `sheava`,
		['shop'] = 'luxury',
	},
	['sultanrs'] = {
		['name'] = 'Sultan RS',
		['brand'] = 'Karin',
		['model'] = 'sultanrs',
		['price'] = 76500,
		['category'] = 'sports',
		['hash'] = `sultanrs`,
		['shop'] = 'luxury',
	},
	['t20'] = {
		['name'] = 'T20',
		['brand'] = 'Progen',
		['model'] = 't20',
		['price'] = 1650000,
		['category'] = 'super',
		['hash'] = `t20`,
		['shop'] = 'luxury',
	},
	['taipan'] = {
		['name'] = 'Taipan',
		['brand'] = 'Cheval',
		['model'] = 'taipan',
		['price'] = 1850000,
		['category'] = 'super',
		['hash'] = `taipan`,
		['shop'] = 'luxury',
	},
	['tempesta'] = {
		['name'] = 'Tempesta',
		['brand'] = 'Pegassi',
		['model'] = 'tempesta',
		['price'] = 120000,
		['category'] = 'super',
		['hash'] = `tempesta`,
		['shop'] = 'luxury',
	},
	['tezeract'] = {
		['name'] = 'Tezeract',
		['brand'] = 'Pegassi',
		['model'] = 'tezeract',
		['price'] = 220000,
		['category'] = 'super',
		['hash'] = `tezeract`,
		['shop'] = 'luxury',
	},
	['thrax'] = {							--DLC
		['name'] = 'Thrax',
		['brand'] = 'Truffade',
		['model'] = 'thrax',
		['price'] = 180000,
		['category'] = 'super',
		['hash'] = `thrax`,
		['shop'] = 'luxury',
	},
	['tigon'] = {
		['name'] = 'Tigon',
		['brand'] = 'Lampadati',
		['model'] = 'tigon',
		['price'] = 240000,
		['category'] = 'super',
		['hash'] = `tigon`,
		['shop'] = 'luxury',
	},
	['turismor'] = {
		['name'] = 'Turismo R',
		['brand'] = 'Grotti',
		['model'] = 'turismor',
		['price'] = 140000,
		['category'] = 'super',
		['hash'] = `turismor`,
		['shop'] = 'luxury',
	},
	['tyrant'] = {
		['name'] = 'Tyrant',
		['brand'] = ' Överflöd',
		['model'] = 'tyrant',
		['price'] = 2100000,
		['category'] = 'super',
		['hash'] = `tyrant`,
		['shop'] = 'luxury',
	},
	['tyrus'] = {
		['name'] = 'Tyrus',
		['brand'] = 'Progen',
		['model'] = 'tyrus',
		['price'] = 230000,
		['category'] = 'super',
		['hash'] = `tyrus`,
		['shop'] = 'luxury',
	},
	['vacca'] = {
		['name'] = 'Vacca',
		['brand'] = 'Pegassi',
		['model'] = 'vacca',
		['price'] = 105000,
		['category'] = 'super',
		['hash'] = `vacca`,
		['shop'] = 'luxury',
	},
	['vagner'] = {
		['name'] = 'Vagner',
		['brand'] = 'Dewbauchee',
		['model'] = 'vagner',
		['price'] = 1660000,
		['category'] = 'super',
		['hash'] = `vagner`,
		['shop'] = 'luxury',
	},
	['visione'] = {
		['name'] = 'Visione',
		['brand'] = 'Grotti',
		['model'] = 'visione',
		['price'] = 750000,
		['category'] = 'sports',
		['hash'] = `visione`,
		['shop'] = 'luxury',
	},
	['voltic'] = {
		['name'] = 'Voltic',
		['brand'] = 'Coil',
		['model'] = 'voltic',
		['price'] = 120000,
		['category'] = 'super',
		['hash'] = `voltic`,
		['shop'] = 'luxury',
	},
	['voltic2'] = {
		['name'] = 'Rocket Voltic',
		['brand'] = 'Coil',
		['model'] = 'voltic2',
		['price'] = 9830400,
		['category'] = 'super',
		['hash'] = `voltic2`,
		['shop'] = 'luxury',
	},
	['xa21'] = {
		['name'] = 'XA-21',
		['brand'] = 'Ocelot',
		['model'] = 'xa21',
		['price'] = 180000,
		['category'] = 'super',
		['hash'] = `xa21`,
		['shop'] = 'luxury',
	},
	['zentorno'] = {
		['name'] = 'Zentorno',
		['brand'] = 'Pegassi',
		['model'] = 'zentorno',
		['price'] = 340000,
		['category'] = 'super',
		['hash'] = `zentorno`,
		['shop'] = 'luxury',
	},
	['zorrusso'] = {							--DLC
		['name'] = 'Zorrusso',
		['brand'] = 'Pegassi',
		['model'] = 'zorrusso',
		['price'] = 277000,
		['category'] = 'super',
		['hash'] = `zorrusso`,
		['shop'] = 'luxury',
	},
	-- Vans
	['bison'] = {
		['name'] = 'Bison',
		['brand'] = 'Bravado',
		['model'] = 'bison',
		['price'] = 18000,
		['category'] = 'vans',
		['hash'] = `bison`,
		
	},
	['bobcatxl'] = {
		['name'] = 'Bobcat XL Open',
		['brand'] = 'Vapid',
		['model'] = 'bobcatxl',
		['price'] = 13500,
		['category'] = 'vans',
		['hash'] = `bobcatxl`,
		
	},
	['burrito3'] = {
		['name'] = 'Burrito',
		['brand'] = 'Declasse',
		['model'] = 'burrito3',
		['price'] = 4000,
		['category'] = 'vans',
		['hash'] = `burrito3`,
		
	},
	['gburrito2'] = {
		['name'] = 'Burrito Custom',
		['brand'] = 'Declasse',
		['model'] = 'gburrito2',
		['price'] = 11500,
		['category'] = 'vans',
		['hash'] = `gburrito2`,
		
	},
	['rumpo'] = {
		['name'] = 'Rumpo',
		['brand'] = 'Bravado',
		['model'] = 'rumpo',
		['price'] = 9000,
		['category'] = 'vans',
		['hash'] = `rumpo`,
		
	},
	['journey'] = {
		['name'] = 'Journey',
		['brand'] = 'Zirconium',
		['model'] = 'journey',
		['price'] = 6500,
		['category'] = 'vans',
		['hash'] = `journey`,
		
	},
	['minivan'] = {
		['name'] = 'Minivan',
		['brand'] = 'Vapid',
		['model'] = 'minivan',
		['price'] = 7000,
		['category'] = 'vans',
		['hash'] = `minivan`,
		
	},
	['minivan2'] = {
		['name'] = 'Minivan Custom',
		['brand'] = 'Vapid',
		['model'] = 'minivan2',
		['price'] = 10000,
		['category'] = 'vans',
		['hash'] = `minivan2`,
		
	},
	['paradise'] = {
		['name'] = 'Paradise',
		['brand'] = 'Bravado',
		['model'] = 'paradise',
		['price'] = 9000,
		['category'] = 'vans',
		['hash'] = `paradise`,
		
	},
	['rumpo3'] = {
		['name'] = 'Rumpo Custom',
		['brand'] = 'Bravado',
		['model'] = 'rumpo3',
		['price'] = 19500,
		['category'] = 'vans',
		['hash'] = `rumpo3`,
		
	},
	['speedo'] = {
		['name'] = 'Speedo',
		['brand'] = 'Vapid',
		['model'] = 'speedo',
		['price'] = 10000,
		['category'] = 'vans',
		['hash'] = `speedo`,
		
	},
	['speedo4'] = {
		['name'] = 'Speedo Custom',
		['brand'] = 'Vapid',
		['model'] = 'speedo4',
		['price'] = 15000,
		['category'] = 'vans',
		['hash'] = `speedo4`,
		
	},
	['surfer'] = {
		['name'] = 'Surfer',
		['brand'] = 'BF',
		['model'] = 'surfer',
		['price'] = 9000,
		['category'] = 'vans',
		['hash'] = `surfer`,
		
	},
	['youga3'] = {
		['name'] = 'Youga Classic 4x4',
		['brand'] = 'Bravado',
		['model'] = 'youga3',
		['price'] = 15000,
		['category'] = 'vans',
		['hash'] = `youga3`,
		
	},
	['youga'] = {
		['name'] = 'Youga',
		['brand'] = 'Bravado',
		['model'] = 'youga',
		['price'] = 8000,
		['category'] = 'vans',
		['hash'] = `youga`,
		
	},
	['youga2'] = {
		['name'] = 'Youga Classic',
		['brand'] = 'Bravado',
		['model'] = 'youga2',
		['price'] = 14500,
		['category'] = 'vans',
		['hash'] = `youga2`,
		
	},
	['youga4'] = { 	 	--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Youga',
		['brand'] = 'Bravado',
		['model'] = 'youga4',
		['price'] = 85000,
		['category'] = 'vans',
		['hash'] = `youga4`,
		
	},
	['mule5'] = { 	 	--DLC +set sv_enforceGameBuild 2545
		['name'] = 'Mule',
		['brand'] = 'Box Truck',
		['model'] = 'mule5',
		['price'] = 221000,
		['category'] = 'vans',
		['hash'] = `mule5`,
		
	},
	-- Utility
	['sadler'] = {
		['name'] = 'Sadler',
		['brand'] = 'Vapid',
		['model'] = 'sadler',
		['price'] = 20000,
		['category'] = 'offroad',
		['hash'] = `sadler`,
		
	},
	['guardian'] = {
		['name'] = 'Guardian',
		['brand'] = 'Annis',
		['price'] = 21000,
		['category'] = 'offroad',
		['model'] = 'guardian',
		['hash'] = `guardian`,
		
	},
	['slamtruck'] = {
		['name'] = 'Slam Truck',
		['brand'] = 'Vapid',
		['model'] = 'slamtruck',
		['price'] = 100000,
		['category'] = 'muscle',
		['hash'] = `slamtruck`,
		
	},
	['warrener2'] = {							--DLC +set sv_enforceGameBuild 2372
		['name'] = 'Warrener HKR',
		['brand'] = 'Vulcar',
		['model'] = 'warrener2',
		['price'] = 30000,
		['category'] = 'sedans',
		['hash'] = `warrener2`,
		
	},
		-- Boats
	['squalo'] = {
		['name'] = 'Squalo',
		['brand'] = 'Shitzu',
		['model'] = 'squalo',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `squalo`,
		['shop'] = 'boats',
	},
	['marquis'] = {
		['name'] = 'Marquis',
		['brand'] = 'Dinka',
		['model'] = 'marquis',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `marquis`,
		['shop'] = 'boats',
	},
	['seashark'] = {
		['name'] = 'Seashark',
		['brand'] = 'Speedophile',
		['model'] = 'seashark',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `seashark`,
		['shop'] = 'boats',
	},
	['seashark2'] = {
		['name'] = 'Seashark',
		['brand'] = 'Speedophile',
		['model'] = 'seashark2',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `seashark2`,
		['shop'] = 'boats',
	},
	['seashark3'] = {
		['name'] = 'Seashark',
		['brand'] = 'Speedophile',
		['model'] = 'seashark3',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `seashark3`,
		['shop'] = 'boats',
	},
	['jetmax'] = {
		['name'] = 'Shitzu',
		['brand'] = 'Jetmax',
		['model'] = 'jetmax',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `jetmax`,
		['shop'] = 'boats',
	},
	['tropic'] = {
		['name'] = 'Shitzu',
		['brand'] = 'Tropic',
		['model'] = 'tropic',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `tropic`,
		['shop'] = 'boats',
	},
	['tropic2'] = {
		['name'] = 'Shitzu',
		['brand'] = 'Tropic',
		['model'] = 'tropic2',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `tropic2`,
		['shop'] = 'boats',
	},
	['dinghy'] = {
		['name'] = 'Nagasaki',
		['brand'] = 'Dinghy',
		['model'] = 'dinghy',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `dinghy`,
		['shop'] = 'boats',
	},
	['dinghy2'] = {
		['name'] = 'Nagasaki',
		['brand'] = 'Dinghy',
		['model'] = 'dinghy2',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `dinghy2`,
		['shop'] = 'boats',
	},
	['dinghy3'] = {
		['name'] = 'Nagasaki',
		['brand'] = 'Dinghy',
		['model'] = 'dinghy3',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `dinghy3`,
		['shop'] = 'boats',
	},
	['dinghy4'] = {
		['name'] = 'Nagasaki',
		['brand'] = 'Dinghy',
		['model'] = 'dinghy4',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `dinghy4`,
		['shop'] = 'boats',
	},
	['suntrap'] = {
		['name'] = 'Shitzu',
		['brand'] = 'Suntrap',
		['model'] = 'suntrap',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `suntrap`,
		['shop'] = 'boats',
	},
	['speeder'] = {
		['name'] = 'Speeder',
		['brand'] = 'Pegassi',
		['model'] = 'speeder',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `speeder`,
		['shop'] = 'boats',
	},
	['speeder2'] = {
		['name'] = 'Speeder',
		['brand'] = 'Pegassi',
		['model'] = 'speeder2',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `speeder2`,
		['shop'] = 'boats',
	},
	['longfin'] = {
		['name'] = 'Longfin',
		['brand'] = 'Shitzu',
		['model'] = 'longfin',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `longfin`,
		['shop'] = 'boats',
	},
	['toro'] = {
		['name'] = 'Toro',
		['brand'] = 'Lampadati',
		['model'] = 'toro',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `toro`,
		['shop'] = 'boats',
	},
	['toro2'] = {
		['name'] = 'Toro',
		['brand'] = 'Lampadati',
		['model'] = 'toro2',
		['price'] = 40000,
		['category'] = 'boats',
		['hash'] = `toro2`,
		['shop'] = 'boats',
	},
	-- helicopters
	['buzzard2'] = {
		['name'] = 'Buzzard',
		['brand'] = 'Unknown',
		['model'] = 'buzzard2',
		['price'] = 52000,
		['category'] = 'helicopters',
		['hash'] = `buzzard2`,
		['shop'] = 'air',
	},
	['frogger'] = {
		['name'] = 'Frogger',
		['brand'] = 'Unknown',
		['model'] = 'frogger',
		['price'] = 52000,
		['category'] = 'helicopters',
		['hash'] = `frogger`,
		['shop'] = 'air',
	},
	['frogger2'] = {
		['name'] = 'Frogger',
		['brand'] = 'Unknown',
		['model'] = 'frogger2',
		['price'] = 52000,
		['category'] = 'helicopters',
		['hash'] = `frogger2`,
		['shop'] = 'air',
	},
	['maverick'] = {
		['name'] = 'Maverick',
		['brand'] = 'Unknown',
		['model'] = 'maverick',
		['price'] = 52000,
		['category'] = 'helicopters',
		['hash'] = `maverick`,
		['shop'] = 'air',
	},
	['swift'] = {
		['name'] = 'Swift',
		['brand'] = 'Buckingham',
		['model'] = 'swift',
		['price'] = 52000,
		['category'] = 'helicopters',
		['hash'] = `swift`,
		['shop'] = 'air',
	},
	['swift2'] = {
		['name'] = 'Swift',
		['brand'] = 'Buckingham',
		['model'] = 'swift2',
		['price'] = 52000,
		['category'] = 'helicopters',
		['hash'] = `swift2`,
		['shop'] = 'air',
	},
	['seasparrow'] = {
		['name'] = 'Sea Sparrow',
		['brand'] = 'Unknown',
		['model'] = 'seasparrow',
		['price'] = 52000,
		['category'] = 'helicopters',
		['hash'] = `seasparrow`,
		['shop'] = 'air',
	},
	['seasparrow2'] = {
		['name'] = 'Sparrow',
		['brand'] = 'Unknown',
		['model'] = 'seasparrow2',
		['price'] = 52000,
		['category'] = 'helicopters',
		['hash'] = `seasparrow2`,
		['shop'] = 'air',
	},
	['seasparrow3'] = {
		['name'] = 'Sparrow',
		['brand'] = 'Unknown',
		['model'] = 'seasparrow3',
		['price'] = 52000,
		['category'] = 'helicopters',
		['hash'] = `seasparrow3`,
		['shop'] = 'air',
	},
	['supervolito'] = {
		['name'] = 'SuperVolito',
		['brand'] = 'Buckingham',
		['model'] = 'supervolito',
		['price'] = 52000,
		['category'] = 'helicopters',
		['hash'] = `supervolito`,
		['shop'] = 'air',
	},
	['supervolito2'] = {
		['name'] = 'SuperVolito Carbon',
		['brand'] = 'Buckingham',
		['model'] = 'supervolito2',
		['price'] = 52000,
		['category'] = 'helicopters',
		['hash'] = `supervolito2`,
		['shop'] = 'air',
	},
	['volatus'] = {
		['name'] = 'Volatus',
		['brand'] = 'Buckingham',
		['model'] = 'volatus',
		['price'] = 52000,
		['category'] = 'helicopters',
		['hash'] = `volatus`,
		['shop'] = 'air',
	},
	['havok'] = {
		['name'] = 'Havok',
		['brand'] = 'Nagasaki',
		['model'] = 'havok',
		['price'] = 52000,
		['category'] = 'helicopters',
		['hash'] = `havok`,
		['shop'] = 'air',
	},
	-- Planes
	['duster'] = {
		['name'] = 'Duster',
		['brand'] = 'Unknown',
		['model'] = 'duster',
		['price'] = 45000,
		['category'] = 'planes',
		['hash'] = `duster`,
		['shop'] = 'air',
	},
	['luxor'] = {
		['name'] = 'Luxor',
		['brand'] = 'Buckingham',
		['model'] = 'luxor',
		['price'] = 45000,
		['category'] = 'planes',
		['hash'] = `luxor`,
		['shop'] = 'air',
	},
	['luxor2'] = {
		['name'] = 'Luxor Deluxe',
		['brand'] = 'Buckingham',
		['model'] = 'luxor2',
		['price'] = 45000,
		['category'] = 'planes',
		['hash'] = `luxor2`,
		['shop'] = 'air',
	},
	['stunt'] = {
		['name'] = 'Mallard',
		['brand'] = 'Unknown',
		['model'] = 'stunt',
		['price'] = 45000,
		['category'] = 'planes',
		['hash'] = `stunt`,
		['shop'] = 'air',
	},
	['mammatus'] = {
		['name'] = 'Mammatus',
		['brand'] = 'Unknown',
		['model'] = 'mammatus',
		['price'] = 45000,
		['category'] = 'planes',
		['hash'] = `mammatus`,
		['shop'] = 'air',
	},
	['velum'] = {
		['name'] = 'Velum',
		['brand'] = 'Unknown',
		['model'] = 'velum',
		['price'] = 45000,
		['category'] = 'planes',
		['hash'] = `velum`,
		['shop'] = 'air',
	},
	['velum2'] = {
		['name'] = 'Velum',
		['brand'] = 'Unknown',
		['model'] = 'velum2',
		['price'] = 45000,
		['category'] = 'planes',
		['hash'] = `velum2`,
		['shop'] = 'air',
	},
	['shamal'] = {
		['name'] = 'Shamal',
		['brand'] = 'Buckingham',
		['model'] = 'shamal',
		['price'] = 45000,
		['category'] = 'planes',
		['hash'] = `shamal`,
		['shop'] = 'air',
	},
	['vestra'] = {
		['name'] = 'Vestra',
		['brand'] = 'Buckingham',
		['model'] = 'vestra',
		['price'] = 45000,
		['category'] = 'planes',
		['hash'] = `vestra`,
		['shop'] = 'air',
	},
	['dodo'] = {
		['name'] = 'Dodo',
		['brand'] = 'Mammoth',
		['model'] = 'dodo',
		['price'] = 45000,
		['category'] = 'planes',
		['hash'] = `dodo`,
		['shop'] = 'air',
	},
	['howard'] = {
		['name'] = 'Howard NX-25',
		['brand'] = 'Buckingham',
		['model'] = 'howard',
		['price'] = 45000,
		['category'] = 'planes',
		['hash'] = `howard`,
		['shop'] = 'air',
	},
	['alphaz1'] = {
		['name'] = 'Alpha-Z1',
		['brand'] = 'Buckingham',
		['model'] = 'alphaz1',
		['price'] = 45000,
		['category'] = 'planes',
		['hash'] = `alphaz1`,
		['shop'] = 'air',
	},
	['nimbus'] = {
		['name'] = 'Nimbus',
		['brand'] = 'Buckingham',
		['model'] = 'nimbus',
		['price'] = 45000,
		['category'] = 'planes',
		['hash'] = `nimbus`,
		['shop'] = 'air',
	},
	['brioso3'] = {          --DLC +set sv_enforceGameBuild 2699 (and below)
        ['name'] = 'Brioso 300 Widebody',
        ['brand'] = 'Grotti',
        ['model'] = 'brioso3',
        ['price'] = 125000,
        ['category'] = 'compacts',
        ['hash'] = `brioso3`,
        
    },
    ['conada'] = {
        ['name'] = 'Conada',
        ['brand'] = 'Buckingham',
        ['model'] = 'conada',
        ['price'] = 115000,
        ['category'] = 'helicopters',
        ['hash'] = `conada`,
        ['shop'] = 'air',
    },
    ['corsita'] = {
        ['name'] = 'Corsita',
        ['brand'] = 'Lampadati',
        ['model'] = 'corsita',
        ['price'] = 90000,
        ['category'] = 'sports',
        ['hash'] = `corsita`,
        ['shop'] = 'luxury',
    },
    ['draugur'] = {
        ['name'] = 'Draugur',
        ['brand'] = 'Declasse',
        ['model'] = 'draugur',
        ['price'] = 99000,
        ['category'] = 'offroad',
        ['hash'] = `draugur`,
        
    },
    ['greenwood'] = {
        ['name'] = 'Greenwood',
        ['brand'] = 'Bravado',
        ['model'] = 'greenwood',
        ['price'] = 105000,
        ['category'] = 'muscle',
        ['hash'] = `greenwood`,
        
    },
    ['kanjosj'] = {
        ['name'] = 'Kanjo SJ',
        ['brand'] = 'Dinka',
        ['model'] = 'kanjosj',
        ['price'] = 143000,
        ['category'] = 'coupes',
        ['hash'] = `kanjosj`,
        
    },
    ['lm87'] = {
        ['name'] = 'LM87',
        ['brand'] = 'Benefactor',
        ['model'] = 'lm87',
        ['price'] = 155000,
        ['category'] = 'super',
        ['hash'] = `lm87`,
        ['shop'] = 'luxury',
    },
    ['omnisegt'] = {
        ['name'] = 'Omnis e-GT',
        ['brand'] = 'Obey',
        ['model'] = 'omnisegt',
        ['price'] = 185000,
        ['category'] = 'sports',
        ['hash'] = `omnisegt`,
        ['shop'] = 'luxury',
    },
    ['postlude'] = {
        ['name'] = 'Postlude',
        ['brand'] = 'Dinka',
        ['model'] = 'postlude',
        ['price'] = 90000,
        ['category'] = 'coupes',
        ['hash'] = `postlude`,
        
    },
    ['rhinehart'] = {
        ['name'] = 'Rhinehart',
        ['brand'] = 'Ubermacht',
        ['model'] = 'rhinehart ',
        ['price'] = 105000,
        ['category'] = 'sedans',
        ['hash'] = `rhinehart`,
        
    },
    ['ruiner4'] = {
        ['name'] = 'Ruiner ZZ-8',
        ['brand'] = 'Imponte',
        ['model'] = 'ruiner4',
        ['price'] = 85000,
        ['category'] = 'muscle',
        ['hash'] = `ruiner4`,
        
    },
    ['sentinel4'] = {
        ['name'] = 'Sentinel Classic Widebody',
        ['brand'] = 'Ubermacht',
        ['model'] = 'sentinel4',
        ['price'] = 140000,
        ['category'] = 'sports',
        ['hash'] = `sentinel4`,
        ['shop'] = 'luxury',
    },
    ['sm722'] = {
        ['name'] = 'SM722',
        ['brand'] = 'Benefactor',
        ['model'] = 'sm722',
        ['price'] = 125000,
        ['category'] = 'sports',
        ['hash'] = `sm722`,
        ['shop'] = 'luxury',
    },
	['tenf'] = {
        ['name'] = '10F',
        ['brand'] = 'Obey',
        ['model'] = 'tenf',
        ['price'] = 185000,
        ['category'] = 'sports',
        ['hash'] = `tenf`,
        ['shop'] = 'luxury',
    },
    ['tenf2'] = {
        ['name'] = '10F Widebody',
        ['brand'] = 'Obey',
        ['model'] = 'tenf2',
        ['price'] = 215000,
        ['category'] = 'sports',
        ['hash'] = `tenf2`,
        ['shop'] = 'luxury',
    },
    ['torero2'] = {
        ['name'] = 'Torero XO',
        ['brand'] = 'Pegassi',
        ['model'] = 'torero2',
        ['price'] = 245000,
        ['category'] = 'super',
        ['hash'] = `torero2`,
        ['shop'] = 'luxury',
    },
    ['vigero2'] = {
        ['name'] = 'Vigero ZX',
        ['brand'] = 'Declasse',
        ['model'] = 'vigero2',
        ['price'] = 105000,
        ['category'] = 'muscle',
        ['hash'] = `vigero2`,
        
    },
    ['weevil2'] = {
        ['name'] = 'Weevil Custom',
        ['brand'] = 'BF',
        ['model'] = 'weevil2',
        ['price'] = 95000,
        ['category'] = 'muscle',
        ['hash'] = `weevil2`,
        
    },
}
local vehicles = {}
for k,v in pairs(Engines) do
	if not vehicles[v.brand] then vehicles[v.brand] = {} end
	table.insert(vehicles[v.brand],v)
end

if Config.custom_engine_enable then
    for k, v in pairs(Config.custom_engine) do
      Engines[k] = v
    end
end

Lists = function()
	return {
		Locals = Engines,
		Custom = Config.custom_engine
	}
end

exports('Engines',Lists)