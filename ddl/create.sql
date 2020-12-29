--- table creation script

CREATE TABLE erml.mine_view (
	id serial NOT NULL,
	shape geometry(POINT, 4326) NULL,
	pkuid int8 NULL,
	identifier varchar NULL,
	"name" varchar NULL,
	status varchar NULL,
	commodity varchar NULL,
	"owner" varchar NULL,
	start_date varchar NULL,
	end_date varchar NULL,
	observation_method varchar NULL,
	positional_accuracy varchar NULL,
	"source" varchar NULL,
	status_uri varchar NULL,
	representative_commodity_uri varchar NULL,
	specification_uri varchar NULL,
	CONSTRAINT mine_view_pkey PRIMARY KEY (id)
);
