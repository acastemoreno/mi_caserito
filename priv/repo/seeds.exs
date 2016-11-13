# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MiCaserito.Repo.insert!(%MiCaserito.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

%HTTPotion.Response{body: body} = HTTPotion.post("http://sistemas.minag.gob.pe/sisap/portal2/ciudades/generos/filtrarPorRegion", region: 150000, ajax: true)
text = Enum.join(for <<c::utf8 <- body>>, do: <<c::utf8>>)
fun = fn([_, number, nombre])-> {number, nombre}end
Regex.scan(~r/id=CHK_(\d+)_CHK><a id=genCheck.\d+><\/a>([\w\s]+)<\/label>/, text)
|> Enum.map(&fun.(&1))
|> IO.inspect
