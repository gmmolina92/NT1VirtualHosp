using Microsoft.EntityFrameworkCore.Migrations;

namespace VirtualHosp.Migrations
{
    public partial class Medicos : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Especialidad",
                table: "Usuarios",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "NumeroMatricula",
                table: "Usuarios",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Discriminator",
                table: "Usuarios",
                nullable: false,
                defaultValue: "");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Especialidad",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "NumeroMatricula",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "Discriminator",
                table: "Usuarios");
        }
    }
}
