using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace VirtualHosp.Migrations
{
    public partial class Medicos3 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
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
                name: "FechaNacimiento",
                table: "Medicos");

            migrationBuilder.DropColumn(
                name: "Nacionalidad",
                table: "Medicos");

            migrationBuilder.DropColumn(
                name: "NumeroDocumento",
                table: "Medicos");

            migrationBuilder.DropColumn(
                name: "Password",
                table: "Medicos");

            migrationBuilder.DropColumn(
                name: "TipoDocumento",
                table: "Medicos");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Ciudad",
                table: "Medicos",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CodigoPostal",
                table: "Medicos",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Direccion",
                table: "Medicos",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Medicos",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "EstadoCivil",
                table: "Medicos",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "FechaNacimiento",
                table: "Medicos",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<string>(
                name: "Nacionalidad",
                table: "Medicos",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "NumeroDocumento",
                table: "Medicos",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "Password",
                table: "Medicos",
                type: "nvarchar(30)",
                maxLength: 30,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "TipoDocumento",
                table: "Medicos",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
