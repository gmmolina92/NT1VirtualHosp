using Microsoft.EntityFrameworkCore.Migrations;

namespace VirtualHosp.Migrations
{
    public partial class Medicos4 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Ciudad",
                table: "Medicos",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CodigoPostal",
                table: "Medicos",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Direccion",
                table: "Medicos",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Medicos",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "EstadoCivil",
                table: "Medicos",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Nacionalidad",
                table: "Medicos",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "NumeroDocumento",
                table: "Medicos",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "TipoDocumento",
                table: "Medicos",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Ciudad",
                table: "Medicos");

            migrationBuilder.DropColumn(
                name: "CodigoPostal",
                table: "Medicos");

            migrationBuilder.DropColumn(
                name: "Direccion",
                table: "Medicos");

            migrationBuilder.DropColumn(
                name: "Email",
                table: "Medicos");

            migrationBuilder.DropColumn(
                name: "EstadoCivil",
                table: "Medicos");

            migrationBuilder.DropColumn(
                name: "Nacionalidad",
                table: "Medicos");

            migrationBuilder.DropColumn(
                name: "NumeroDocumento",
                table: "Medicos");

            migrationBuilder.DropColumn(
                name: "TipoDocumento",
                table: "Medicos");
        }
    }
}
