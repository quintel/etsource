# Object Relation Mapper for ETSource

The object relation mapper for ETSource is designed to:

1. Provide a common way to (mass) manipulate objects in ETSource
2. Run validations
3. Easier import of ETSource

## Easy scripts to (mass) manipulate objects

E.g. when you would like to update all the percentage units for gqueries:

```Ruby
Gquery.all.each do |gquery|
  gquery.unit = "percentage" if gquery.unit == "%"
  gquery.save!
end
```

And hurray! You have changed all those gqueries.

## Run validations

When you are updating/manipulating an object, you can (or must) run validations.

When an object is invalid, you can ask the object which 'parts' are invalid.

```Ruby
gquery = ETSource::Gquery.find(:co2_emissions_total)
gquery.unit = nil

gquery.save!
=> false

gquery.errors.message
=> {:unit=>["can't be blank"]}
```

Validation will be run at three levels:

1. We can have the Continuous Integration server checking whether all objects
   are valid, thus to prevent malicious data.
2. You will not be able to save the File through the ORM when the object is not
   valid.
3. ETengine import of ETSource date will only proceed when all objects are
   valid.

## Easier import for data from ETSource

With the ORM it will be easier to import all the objects needed for instance
for ETEngine.
