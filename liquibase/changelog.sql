--liquibase formatted sql

--changeset author:id1
--rollback ALTER TABLE burgers DROP bun;

ALTER TABLE burgers ADD COLUMN bun varchar(255);

--changeset author:id2
--rollback ALTER TABLE burgers DROP pickles;

ALTER TABLE burgers ADD COLUMN pickles boolean;

--changeset author:joe id:2
--rollback ALTER TABLE burgers DROP tomatoes;

ALTER TABLE burgers ADD COLUMN tomatoes boolean;

--changeset id:add-onions
--rollback ALTER TABLE burgers DROP onions;

ALTER TABLE burgers ADD COLUMN onions boolean;

--changeset add-toppings:1
--rollback ALTER TABLE burgers DROP lettuce;

ALTER TABLE burgers ADD COLUMN lettuce boolean;

--changeset add-toppings:2
--rollback ALTER TABLE burgers DROP ketchup;

ALTER TABLE burgers ADD COLUMN ketchup boolean;
