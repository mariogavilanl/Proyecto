--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bsc_ideas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_ideas (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100),
    incluir boolean NOT NULL,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_ideas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_ideas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_ideas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_ideas_id_seq OWNED BY public.bsc_ideas.id;


--
-- Name: bsc_inventario_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_inventario_item (
    id integer NOT NULL,
    org_persona_id_registrado_por integer NOT NULL,
    bsc_plan_de_cuentas_id integer NOT NULL,
    bsc_proveedor_id integer NOT NULL,
    bsc_inventario_unidad_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(30),
    descripcion character varying(500),
    precio_con_impuesto integer,
    url text,
    observacion character varying(500),
    fecha_registro date NOT NULL
);


--
-- Name: bsc_inventario_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_inventario_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_inventario_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_inventario_item_id_seq OWNED BY public.bsc_inventario_item.id;


--
-- Name: bsc_inventario_unidad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_inventario_unidad (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(30) NOT NULL,
    descripcion character varying(500),
    orden integer,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_inventario_unidad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_inventario_unidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_inventario_unidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_inventario_unidad_id_seq OWNED BY public.bsc_inventario_unidad.id;


--
-- Name: bsc_kpi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_kpi (
    id integer NOT NULL,
    bsc_proyecto_id integer NOT NULL,
    bsc_objetivo_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5),
    descripcion character varying(500),
    orden integer,
    formula character varying(500),
    fecha_registro date NOT NULL
);


--
-- Name: bsc_kpi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_kpi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_kpi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_kpi_id_seq OWNED BY public.bsc_kpi.id;


--
-- Name: bsc_kpi_meta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_kpi_meta (
    id integer NOT NULL,
    bsc_kpi_id integer NOT NULL,
    periodo character varying(10) NOT NULL,
    resultado character varying(500),
    evaluacion character varying(500),
    x1 character varying(500),
    x2 character varying(500),
    observacion text,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_kpi_meta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_kpi_meta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_kpi_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_kpi_meta_id_seq OWNED BY public.bsc_kpi_meta.id;


--
-- Name: bsc_linea; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_linea (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5),
    descripcion character varying(500),
    orden integer,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_linea_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_linea_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_linea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_linea_id_seq OWNED BY public.bsc_linea.id;


--
-- Name: bsc_lugar; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_lugar (
    id integer NOT NULL,
    bsc_lugar_id_padre integer,
    nivel integer NOT NULL,
    lugar character varying(50),
    edificio character varying(50),
    area character varying(50),
    piso integer,
    subarea character varying(50),
    fecha_registro date NOT NULL
);


--
-- Name: bsc_lugar_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_lugar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_lugar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_lugar_id_seq OWNED BY public.bsc_lugar.id;


--
-- Name: bsc_objetivo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_objetivo (
    id integer NOT NULL,
    bsc_tipo_objetivo_id integer NOT NULL,
    bsc_tema_id integer,
    org_departamento_id_responsable integer,
    nombre character varying(50) NOT NULL,
    alias character varying(5) NOT NULL,
    descripcion character varying(500),
    orden integer,
    codigo character varying(5) NOT NULL,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_objetivo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_objetivo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_objetivo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_objetivo_id_seq OWNED BY public.bsc_objetivo.id;


--
-- Name: bsc_perspectiva; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_perspectiva (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5) NOT NULL,
    descripcion character varying(500),
    orden integer,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_perspectiva_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_perspectiva_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_perspectiva_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_perspectiva_id_seq OWNED BY public.bsc_perspectiva.id;


--
-- Name: bsc_plan_de_cuentas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_plan_de_cuentas (
    id integer NOT NULL,
    bsc_plan_de_cuentas_id_padre integer NOT NULL,
    nivel integer NOT NULL,
    codigo character varying(100) NOT NULL,
    nombre character varying(100) NOT NULL,
    presupuesto_anual_final integer,
    presupuesto_anual_original integer,
    observacion character varying(500),
    reasignable boolean,
    mostrar_en_items boolean NOT NULL,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_plan_de_cuentas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_plan_de_cuentas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_plan_de_cuentas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_plan_de_cuentas_id_seq OWNED BY public.bsc_plan_de_cuentas.id;


--
-- Name: bsc_proceso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_proceso (
    id integer NOT NULL,
    bsc_proceso_id_padre integer NOT NULL,
    nivel integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5),
    descripcion character varying(500),
    orden integer,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_proceso_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_proceso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_proceso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_proceso_id_seq OWNED BY public.bsc_proceso.id;


--
-- Name: bsc_proveedor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_proveedor (
    id integer NOT NULL,
    organizacion character varying(50) NOT NULL,
    contacto character varying(50),
    cargo character varying(50),
    email character varying(100),
    telefono_trabajo character varying(25),
    telefono_movil character varying(25),
    telefono_personal character varying(25),
    direccion character varying(100),
    ciudad character varying(100),
    estado_provincia character varying(100),
    pais_region character varying(50),
    codigo_postal character varying(10),
    pagina_web character varying(100),
    observaciones text,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_proveedor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_proveedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_proveedor_id_seq OWNED BY public.bsc_proveedor.id;


--
-- Name: bsc_proyecto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_proyecto (
    id integer NOT NULL,
    org_persona_id_responsable integer NOT NULL,
    org_departamento_id_responsable integer NOT NULL,
    bsc_tipo_proyecto_id integer NOT NULL,
    bsc_proceso_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5) NOT NULL,
    descripcion character varying(500),
    orden integer,
    codigo character varying(5),
    incluir boolean NOT NULL,
    objetivo_general character varying(500),
    presupuesto integer,
    observaciones character varying(500),
    fecha_registro date NOT NULL
);


--
-- Name: bsc_proyecto_actividad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_proyecto_actividad (
    id integer NOT NULL,
    bsc_proyecto_objetivo_especifico_id integer NOT NULL,
    org_persona_id_registrador_por integer NOT NULL,
    org_persona_id_responsable integer NOT NULL,
    col_pdca_id integer,
    bsc_proyecto_actividad_tipoactividad_id integer,
    org_ambito_id integer,
    org_centro_costo_id integer,
    bsc_lugar_id integer,
    nombre character varying(50) DEFAULT NULL::character varying,
    descripcion character varying(500) DEFAULT NULL::character varying,
    fecha_registro date NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_termino date NOT NULL,
    incluir_en_pao boolean NOT NULL,
    porcentaje_completado integer,
    observacion_control_gestion text
);


--
-- Name: bsc_proyecto_actividad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_proyecto_actividad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_proyecto_actividad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_proyecto_actividad_id_seq OWNED BY public.bsc_proyecto_actividad.id;


--
-- Name: bsc_proyecto_actividad_tipoactividad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_proyecto_actividad_tipoactividad (
    id integer NOT NULL,
    bsc_proyecto_actividad_tipoactividad_id_padre integer NOT NULL,
    nivel integer NOT NULL,
    nombre character varying(50),
    alias character varying(5),
    descripcion character varying(500),
    orden integer,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_proyecto_actividad_tipoactividad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_proyecto_actividad_tipoactividad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_proyecto_actividad_tipoactividad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_proyecto_actividad_tipoactividad_id_seq OWNED BY public.bsc_proyecto_actividad_tipoactividad.id;


--
-- Name: bsc_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_proyecto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_proyecto_id_seq OWNED BY public.bsc_proyecto.id;


--
-- Name: bsc_proyecto_inventario_recursos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_proyecto_inventario_recursos (
    id integer NOT NULL,
    bsc_proyecto_inventario_pedido_id integer NOT NULL,
    bsc_proyecto_inventario_item_id integer NOT NULL,
    numero_fila integer NOT NULL,
    cantidad integer,
    cantidad_recepcionada integer,
    solicitante_no_comprar boolean NOT NULL,
    revisor_rechazado boolean NOT NULL,
    observacion character varying(500) DEFAULT NULL::character varying,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_proyecto_inventario_recursos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_proyecto_inventario_recursos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_proyecto_inventario_recursos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_proyecto_inventario_recursos_id_seq OWNED BY public.bsc_proyecto_inventario_recursos.id;


--
-- Name: bsc_proyecto_objetivo_especifico; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_proyecto_objetivo_especifico (
    id integer NOT NULL,
    bsc_r_proyecto_linea_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5),
    descripcion character varying(500),
    orden integer,
    evidencias text,
    logro integer,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_proyecto_objetivo_especifico_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_proyecto_objetivo_especifico_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_proyecto_objetivo_especifico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_proyecto_objetivo_especifico_id_seq OWNED BY public.bsc_proyecto_objetivo_especifico.id;


--
-- Name: bsc_proyecto_pedido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_proyecto_pedido (
    id integer NOT NULL,
    bsc_proyecto_actividad_id integer NOT NULL,
    org_persona_id_solicitante integer NOT NULL,
    bsc_proveedor_id integer NOT NULL,
    bsc_tipo_documento_id integer NOT NULL,
    fecha_registro date NOT NULL,
    fecha_proceso date,
    fecha_cierre date,
    descripcion character varying(500) DEFAULT NULL::character varying,
    observaciones character varying(500) DEFAULT NULL::character varying
);


--
-- Name: bsc_proyecto_pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_proyecto_pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_proyecto_pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_proyecto_pedido_id_seq OWNED BY public.bsc_proyecto_pedido.id;


--
-- Name: bsc_r_objetivo_departamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_r_objetivo_departamento (
    bsc_objetivo_id integer NOT NULL,
    org_departamento_id integer NOT NULL,
    lidera boolean NOT NULL,
    fecha_registro date NOT NULL,
    id integer
);


--
-- Name: bsc_r_plan_de_cuentas_departamento_presupuesto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_r_plan_de_cuentas_departamento_presupuesto (
    bsc_plan_de_cuentas_id integer NOT NULL,
    org_departamento_id integer NOT NULL,
    presupuesto integer,
    observacion character varying(500) DEFAULT NULL::character varying,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_r_proyecto_linea; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_r_proyecto_linea (
    id integer NOT NULL,
    bsc_proyecto_id integer NOT NULL,
    bsc_linea_id integer NOT NULL,
    descripcion character varying(500),
    fecha_registro date NOT NULL
);


--
-- Name: bsc_r_proyecto_linea_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_r_proyecto_linea_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_r_proyecto_linea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_r_proyecto_linea_id_seq OWNED BY public.bsc_r_proyecto_linea.id;


--
-- Name: bsc_r_proyecto_objetivo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_r_proyecto_objetivo (
    bsc_objetivo_id integer NOT NULL,
    bsc_proyecto_id integer NOT NULL,
    incluir boolean NOT NULL,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_r_proyecto_persona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_r_proyecto_persona (
    bsc_proyecto_id integer NOT NULL,
    org_persona_id integer NOT NULL,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_r_situacion_departamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_r_situacion_departamento (
    id integer NOT NULL,
    org_departamento_id integer NOT NULL,
    est_situacion_id integer NOT NULL,
    incluir boolean NOT NULL,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_r_situacion_departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_r_situacion_departamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_r_situacion_departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_r_situacion_departamento_id_seq OWNED BY public.bsc_r_situacion_departamento.id;


--
-- Name: bsc_situacion_departamento_idea_proyecto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_situacion_departamento_idea_proyecto (
    bsc_r_situacion_departamento_id integer NOT NULL,
    bsc_idea_id integer NOT NULL,
    bsc_proyecto_id integer NOT NULL,
    cantidad_votos integer,
    incluir boolean,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_tema; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_tema (
    id integer NOT NULL,
    bsc_perspectiva_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5) NOT NULL,
    descripcion character varying(500),
    orden integer,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_tema_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_tema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_tema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_tema_id_seq OWNED BY public.bsc_tema.id;


--
-- Name: bsc_tipo_documento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_tipo_documento (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5) NOT NULL,
    descripcion character varying(500) DEFAULT NULL::character varying,
    orden integer,
    impuesto double precision,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_tipo_documento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_tipo_documento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_tipo_documento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_tipo_documento_id_seq OWNED BY public.bsc_tipo_documento.id;


--
-- Name: bsc_tipo_objetivo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_tipo_objetivo (
    id integer NOT NULL,
    bsc_tipo_objetivo_id_padre integer NOT NULL,
    nivel integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(30),
    descripcion character varying(500),
    orden integer,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_tipo_objetivo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_tipo_objetivo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_tipo_objetivo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_tipo_objetivo_id_seq OWNED BY public.bsc_tipo_objetivo.id;


--
-- Name: bsc_tipo_proyecto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bsc_tipo_proyecto (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5),
    descripcion character varying(500),
    orden integer,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_tipo_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bsc_tipo_proyecto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bsc_tipo_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bsc_tipo_proyecto_id_seq OWNED BY public.bsc_tipo_proyecto.id;


--
-- Name: col_pdca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.col_pdca (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5) NOT NULL,
    descripcion character varying(500),
    orden integer,
    fecha_registro date NOT NULL
);


--
-- Name: col_pdca_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.col_pdca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: col_pdca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.col_pdca_id_seq OWNED BY public.col_pdca.id;


--
-- Name: est_impacto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.est_impacto (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5) NOT NULL,
    fecha_registro date NOT NULL
);


--
-- Name: est_impacto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.est_impacto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: est_impacto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.est_impacto_id_seq OWNED BY public.est_impacto.id;


--
-- Name: est_importancia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.est_importancia (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5) NOT NULL,
    fecha_registro date NOT NULL
);


--
-- Name: est_importancia_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.est_importancia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: est_importancia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.est_importancia_id_seq OWNED BY public.est_importancia.id;


--
-- Name: est_modelo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.est_modelo (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5) NOT NULL,
    descripcion character varying(500),
    orden integer,
    aplica_solo_a_departamentos boolean NOT NULL,
    fecha_registro date NOT NULL
);


--
-- Name: est_modelo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.est_modelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: est_modelo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.est_modelo_id_seq OWNED BY public.est_modelo.id;


--
-- Name: est_situacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.est_situacion (
    id integer NOT NULL,
    est_submodelo_id integer NOT NULL,
    bsc_objetivo_id integer NOT NULL,
    est_impacto_id integer NOT NULL,
    est_importancia_id integer NOT NULL,
    est_urgencia_ud integer,
    nombre character varying(50) NOT NULL,
    alias character varying(5),
    descripcion character varying(500),
    orden integer,
    incluir boolean NOT NULL,
    fecha_registro date NOT NULL,
    est_urgencia_id integer
);


--
-- Name: est_situacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.est_situacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: est_situacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.est_situacion_id_seq OWNED BY public.est_situacion.id;


--
-- Name: est_submodelo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.est_submodelo (
    id integer NOT NULL,
    est_modelo_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5) NOT NULL,
    descripcion character varying(500),
    orden integer,
    fecha_registro date NOT NULL
);


--
-- Name: est_submodelo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.est_submodelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: est_submodelo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.est_submodelo_id_seq OWNED BY public.est_submodelo.id;


--
-- Name: est_urgencia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.est_urgencia (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5) NOT NULL,
    fecha_registro date NOT NULL
);


--
-- Name: est_urgencia_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.est_urgencia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: est_urgencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.est_urgencia_id_seq OWNED BY public.est_urgencia.id;


--
-- Name: org_ambito; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_ambito (
    id integer NOT NULL,
    org_ambito_id_padre integer NOT NULL,
    nivel integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5) NOT NULL,
    descripcion character varying(500),
    orden integer,
    fecha_registro date NOT NULL
);


--
-- Name: org_ambito_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_ambito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_ambito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_ambito_id_seq OWNED BY public.org_ambito.id;


--
-- Name: org_centro_costo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_centro_costo (
    id integer NOT NULL,
    org_centro_costo_id_padre integer NOT NULL,
    nivel integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5) NOT NULL,
    descripcion character varying(500),
    orden integer,
    fecha_registro date NOT NULL
);


--
-- Name: org_centro_costo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_centro_costo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_centro_costo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_centro_costo_id_seq OWNED BY public.org_centro_costo.id;


--
-- Name: org_departamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_departamento (
    id integer NOT NULL,
    org_departamento_id_padre integer NOT NULL,
    nivel integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(5) NOT NULL,
    descripcion character varying(500),
    orden integer,
    fecha_registro date NOT NULL
);


--
-- Name: org_departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_departamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_departamento_id_seq OWNED BY public.org_departamento.id;


--
-- Name: org_persona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_persona (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    alias character varying(30) NOT NULL,
    descripcion character varying(500),
    orden integer,
    fecha_registro date NOT NULL
);


--
-- Name: org_persona_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_persona_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_persona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_persona_id_seq OWNED BY public.org_persona.id;


--
-- Name: org_r_persona_cargo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_r_persona_cargo (
    org_cargo_id integer NOT NULL,
    org_persona_id integer NOT NULL,
    fecha_registro date NOT NULL
);


--
-- Name: org_r_persona_departamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_r_persona_departamento (
    org_departamento_id integer NOT NULL,
    org_persona_id integer NOT NULL,
    fecha_registro date NOT NULL
);


--
-- Name: bsc_ideas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_ideas ALTER COLUMN id SET DEFAULT nextval('public.bsc_ideas_id_seq'::regclass);


--
-- Name: bsc_inventario_item id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_inventario_item ALTER COLUMN id SET DEFAULT nextval('public.bsc_inventario_item_id_seq'::regclass);


--
-- Name: bsc_inventario_unidad id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_inventario_unidad ALTER COLUMN id SET DEFAULT nextval('public.bsc_inventario_unidad_id_seq'::regclass);


--
-- Name: bsc_kpi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_kpi ALTER COLUMN id SET DEFAULT nextval('public.bsc_kpi_id_seq'::regclass);


--
-- Name: bsc_kpi_meta id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_kpi_meta ALTER COLUMN id SET DEFAULT nextval('public.bsc_kpi_meta_id_seq'::regclass);


--
-- Name: bsc_linea id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_linea ALTER COLUMN id SET DEFAULT nextval('public.bsc_linea_id_seq'::regclass);


--
-- Name: bsc_lugar id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_lugar ALTER COLUMN id SET DEFAULT nextval('public.bsc_lugar_id_seq'::regclass);


--
-- Name: bsc_objetivo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_objetivo ALTER COLUMN id SET DEFAULT nextval('public.bsc_objetivo_id_seq'::regclass);


--
-- Name: bsc_perspectiva id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_perspectiva ALTER COLUMN id SET DEFAULT nextval('public.bsc_perspectiva_id_seq'::regclass);


--
-- Name: bsc_plan_de_cuentas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_plan_de_cuentas ALTER COLUMN id SET DEFAULT nextval('public.bsc_plan_de_cuentas_id_seq'::regclass);


--
-- Name: bsc_proceso id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proceso ALTER COLUMN id SET DEFAULT nextval('public.bsc_proceso_id_seq'::regclass);


--
-- Name: bsc_proveedor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proveedor ALTER COLUMN id SET DEFAULT nextval('public.bsc_proveedor_id_seq'::regclass);


--
-- Name: bsc_proyecto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto ALTER COLUMN id SET DEFAULT nextval('public.bsc_proyecto_id_seq'::regclass);


--
-- Name: bsc_proyecto_actividad id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_actividad ALTER COLUMN id SET DEFAULT nextval('public.bsc_proyecto_actividad_id_seq'::regclass);


--
-- Name: bsc_proyecto_actividad_tipoactividad id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_actividad_tipoactividad ALTER COLUMN id SET DEFAULT nextval('public.bsc_proyecto_actividad_tipoactividad_id_seq'::regclass);


--
-- Name: bsc_proyecto_inventario_recursos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_inventario_recursos ALTER COLUMN id SET DEFAULT nextval('public.bsc_proyecto_inventario_recursos_id_seq'::regclass);


--
-- Name: bsc_proyecto_objetivo_especifico id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_objetivo_especifico ALTER COLUMN id SET DEFAULT nextval('public.bsc_proyecto_objetivo_especifico_id_seq'::regclass);


--
-- Name: bsc_proyecto_pedido id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_pedido ALTER COLUMN id SET DEFAULT nextval('public.bsc_proyecto_pedido_id_seq'::regclass);


--
-- Name: bsc_r_proyecto_linea id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_proyecto_linea ALTER COLUMN id SET DEFAULT nextval('public.bsc_r_proyecto_linea_id_seq'::regclass);


--
-- Name: bsc_r_situacion_departamento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_situacion_departamento ALTER COLUMN id SET DEFAULT nextval('public.bsc_r_situacion_departamento_id_seq'::regclass);


--
-- Name: bsc_tema id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_tema ALTER COLUMN id SET DEFAULT nextval('public.bsc_tema_id_seq'::regclass);


--
-- Name: bsc_tipo_documento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_tipo_documento ALTER COLUMN id SET DEFAULT nextval('public.bsc_tipo_documento_id_seq'::regclass);


--
-- Name: bsc_tipo_objetivo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_tipo_objetivo ALTER COLUMN id SET DEFAULT nextval('public.bsc_tipo_objetivo_id_seq'::regclass);


--
-- Name: bsc_tipo_proyecto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_tipo_proyecto ALTER COLUMN id SET DEFAULT nextval('public.bsc_tipo_proyecto_id_seq'::regclass);


--
-- Name: col_pdca id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.col_pdca ALTER COLUMN id SET DEFAULT nextval('public.col_pdca_id_seq'::regclass);


--
-- Name: est_impacto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_impacto ALTER COLUMN id SET DEFAULT nextval('public.est_impacto_id_seq'::regclass);


--
-- Name: est_importancia id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_importancia ALTER COLUMN id SET DEFAULT nextval('public.est_importancia_id_seq'::regclass);


--
-- Name: est_modelo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_modelo ALTER COLUMN id SET DEFAULT nextval('public.est_modelo_id_seq'::regclass);


--
-- Name: est_situacion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_situacion ALTER COLUMN id SET DEFAULT nextval('public.est_situacion_id_seq'::regclass);


--
-- Name: est_submodelo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_submodelo ALTER COLUMN id SET DEFAULT nextval('public.est_submodelo_id_seq'::regclass);


--
-- Name: est_urgencia id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_urgencia ALTER COLUMN id SET DEFAULT nextval('public.est_urgencia_id_seq'::regclass);


--
-- Name: org_ambito id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_ambito ALTER COLUMN id SET DEFAULT nextval('public.org_ambito_id_seq'::regclass);


--
-- Name: org_centro_costo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_centro_costo ALTER COLUMN id SET DEFAULT nextval('public.org_centro_costo_id_seq'::regclass);


--
-- Name: org_departamento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_departamento ALTER COLUMN id SET DEFAULT nextval('public.org_departamento_id_seq'::regclass);


--
-- Name: org_persona id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_persona ALTER COLUMN id SET DEFAULT nextval('public.org_persona_id_seq'::regclass);


--
-- Data for Name: bsc_ideas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_ideas (id, nombre, descripcion, incluir, fecha_registro) FROM stdin;
1	00A848KWU	WCC04WA7S70	f	1971-03-09
2	Q74	J6O39DFL85	f	2015-11-30
3	T	PU77823H9ANM99OGB57T081J0	f	2011-11-23
4	3NO40JEX3LQ8	41U61102E0EV1F47A9	f	1986-01-02
5	SI15W4575I527TR7	5B5BNIL10U	f	2001-10-12
6	D80X	\N	t	1983-02-02
7	E9DL	9M51	t	1992-06-13
8	2Q507C026274Y7E8W7RHCC5M970G3P	86E4J63SEJZC5016J29XU287N8G8H7379871K9B	f	2002-04-01
9	JQO10XA4X306P44GU1J34HN4N3USVDCUE720Y0KCZD65Y4N545	7192931C5	f	1970-03-05
10	P56258	6ZADG818DQ16QY1OU1GE6YL0K5B08C75Z7903Q1P3RMQK	f	1997-07-01
11	36GSX	1N721N62J	f	1998-10-22
12	55MD8WQ4V48JVFPP7699MKJ2I8V0680C32K26	R011HR8810360F607A	f	1970-01-05
13	76	942NUFQ6TV8QBV8D	f	2018-07-22
14	SY9NB4RU8VXGE940	5XVJ114IA2IO7R8BQ6E1GOK83DC	f	1970-01-01
15	9ZWCF8	2452DC52995CJU98056Q810VMJ	t	1984-12-22
16	X4544SP0V27SS4335I0530I8LW73NN103P	ZY88098W937ISU648FJ9AGBQ7GY16Y4	f	2014-10-26
17	K261F7Q918750Q49SXI353FTIF7UNF1YCK1Z89L207Y4F2D3O6	NXVP6UL3M2L2CE68XAU3V20D14NWAPL04NYT69A6008VA8N54161HNA0WS7Q9UI25M73LS9PY75I922893D25Z	f	2004-05-21
18	9LJQ5L6	4M46S3B0P0ZB1RJ8X545D5K8HVZ764159Q1SU2117L42R0WF736HUY36OKBNTNBR0DTY2BU14OD317TT5WHV8M158VLMMMR9CMQ4	f	1972-07-30
19	13MF3Z67O4	AXOXK276386A8QFR84AX9VZ977W7P3MJF68W4CGXAQ5KUB5GU2G0MM4OAUQI06ISX316J6DST11Y7	t	2010-08-03
20	3V2009C6D1T	VRR35IZ0FQ9K62	f	1970-03-24
21	S5173UQ6Q56X8K9NB1S20	1K98	f	1977-06-19
22	Q9VPS9M70Y40JK8034857428V0MS8	46QR97JS4GP37RZ7K2L85	t	2019-02-22
23	I	812N66M598NQJG099D79P747Y00T217LY27CG10112I5741	f	2008-08-12
24	T330O1H39635QC	A3T64	f	1978-10-03
25	QEAX49EH211YJL4HL4G36K8CT65HA1GH05W4F6ZTDH78S6B190	2GTLZ	t	1970-11-09
26	UZ6N3G7632CLIU22M5A2IX4	7313WR1OKMJ45Q6KE3KZ4D	f	1970-02-01
27	I0Y0K497DCR6KUCW9D519WC3GA37Z09I8GQ61AG9Y638N704JC	Q4T	f	1997-05-28
28	68L2V5M5JF120O69AR	8VP26XB046O7645NUV53LFNZ952E622N1WXI7GM39AMP50M	t	1970-03-29
29	EX4G8A803V45F97UC0PS35C	KBOCNBSC62352F9DLC97131EY1ZL9QR6322	f	1975-11-16
30	8V9KCL99AHM56V5XSIIR	N9UC8EGJY0KS6020NS9433EMA5UB0BN8D4573A	t	1970-04-08
31	920KZQSYKFKHRVT2C39X3PY16307P7L28OF	A9W2V1	f	2021-10-19
32	4J1NC5627K10D	2X82K98TS38M8L25Y9YJ2G98TJFSP47PVU	t	2001-06-28
33	AN31Y	397K2	f	1997-08-10
34	62537MI7W	S51LJ45	f	1979-11-27
35	KJ88AJ71118K921G1AB88MAKR327GX76O30515VS91R	34	f	2019-01-02
36	1064O3HH4J65NY57Z7CL4H1330U1685VJD48971J	9WK7BAK65OPSO74NO2ILVK7BQ59KMQW348H6W18P1TFMJ4036B632I1319	f	2010-06-10
37	727X865ZWTX4I66W6R4Q9IH	GBSM3Z22P	t	1977-06-08
38	662C79K	8M9LQ2TT6H8W782LV6PEAW0ECNO9414M3NKB8S6ZNKEG1Y7V65BL06R94XOYEIZPC5U04Q927Y9RFOIC964IZ1	t	2021-05-18
39	42FT8GSPZ34UT677NG8KK9DQSDML1X5	M0Q1725615364J5VKS0YZ18Z6L270TOY9VN0BF	f	1995-12-08
40	621446AH1PC228921LTF4LV	B	f	1985-09-02
41	3H2	E954LKB1110U3BW	t	2009-06-06
42	W451Q257085N	4Z8624C	t	2007-03-22
43	KW01KB0IPGU09M55W	3NRSN22ZFOIO289EXMG7Y371A0T22ZFEG	t	1974-01-09
44	PH8KA0	43DQ15UTU310912S4BB1119DJ8JS	t	1997-05-23
45	D9HA3293A240J	\N	t	1970-05-22
46	Q1VL	2CGMKL	t	2011-11-30
47	NV7K03UBN26YD65T25Y5HK57FU0Y34	\N	f	1972-01-30
48	17YNW0V52IE8186131E2HS3W1S8X3HNE8ZYZ	233O4T5O77G6K704OC213Q6H	t	2011-08-12
49	9U107GM	Z1POJQ9554GTBB57CDGY41T5R2YL	f	1972-02-05
50	551GJ0V3F3573AD99653G5WLZ3T58W9P34	G7	f	1997-02-22
\.


--
-- Data for Name: bsc_inventario_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_inventario_item (id, org_persona_id_registrado_por, bsc_plan_de_cuentas_id, bsc_proveedor_id, bsc_inventario_unidad_id, nombre, alias, descripcion, precio_con_impuesto, url, observacion, fecha_registro) FROM stdin;
1	24	3	7	22	JK1E7UKX	W	7782C8I437X5PS43M4IRDW632UG96N7OYRI55R84KC3TO26S34RS0X7F7A3IFTDF475B3NC1	-943839737	http://www.witareinghin.kr/the/erher/tioisre/teereherher.htm#35	LQYL881P3ZSNT396Q59C29	2002-09-14
2	10	23	28	1	I020499C3L1XC	X	4D0X01242NH	\N	\N	798MDL2V9L92J7RGW528B6D0713	1983-07-12
3	21	18	27	27	DT3589R8A	2706O	3VM9	-409185753	http://shoenthest.ua/omeitand/stngve/stith/tiheandeve.htm	4H	1983-01-15
4	28	42	45	22	3Q683084	K	EZI41K362Y	-476	https://letedthiwa.ge/atantio/ntshose/orthied.php?t=59&p=5039	C3S3F416651XCCD5GLX30948D9AX6	1981-12-19
5	34	20	1	39	6YQV498J6	N	HCZ9WWYY5RJ30IP641E7RTR0QBS2KY615NNG40D0D	-12972683	https://hathioror.se/thehasho/omehatver/allineauld.htm	T	1988-05-06
6	14	46	28	30	UH	1	7KB3J78A185	\N	\N	Q2D16150MEGZTJ5Z2RLH1U1CY9MLQ6A7	1990-11-02
7	13	30	21	46	K9W61M31M43A80W2K7	C75M	28D7YI2452P541O3FO4423VHZP9YU39YN	-1624469049	http://notbutteall.it/reisat/atal/onomeallted.asp	F1J816R2O1Z2X1EXGIN1I62B129PWJ93K3543V28C	1980-01-02
8	39	18	23	38	42SJG15W8I1ZC4DTB	PW9	393JM7E1D2C2X0MP2V9LF89T7J99O5URS798EPL4	-307310126	https://www.arithissho.fi/enthiare/st/tioeaalleve.asp?id=122	SG2L62A	2007-09-21
9	12	19	42	17	XBB720206WQ	8	36	-1209708887	https://waith.il/and/itenhad/enttio/aslealleve.htm	75GMD5207D8I46091550TPQT0OP5Q4K6M8	1996-10-25
10	20	47	11	46	19D2VYC568N45PIGRU7XB39F0RPBC50SN	S	3695B1	-429275820	http://www.anisesthe.ch/foritour/hiserehad/yououlnt/onbutnot.html#28997	659Z5X9BLA30754R	2020-05-20
11	8	39	4	48	UKX6XZ844H5357Z6	ST	V7IO59005	-1922734024	http://wittetedted.org/nt/ere/isare/teortibut.php?t=52&p=78	05PLY3YPT6XDW722	1970-01-07
12	4	3	37	16	8675SL80482D6O0Z2TDNV487924NJ917VZ2I910YCD	HYQC	04WTO14K2BMFA19V23Z8WKM2Y0GRPI32O53I	-1490537754	http://hatandisne.tr/anhen/uld/butareti/athisin.php	AS1MN4DEW0	1971-12-19
13	31	27	8	3	PT8394S	78	P	\N	\N	OO4C12C27A8YL89Y2U1619QRO83Q8V5S5Y0	2020-06-11
14	27	11	21	10	7QQ7S00U2V4I3HJ10Z0PZ	\N	M4L53F0	6	https://eraitheaare.at/edalto/tha/tedntea/witomeiteve.htm#54728	Q02C1815MIM1PB6389I2MA981VF3N2FX11A25RO178OC1UB4G12CL6D39860UOUQIF4S	1990-10-20
15	29	10	42	43	43C9MR1R3N379	04	5ZVNGS01658Y04R068W1A	-950747444	http://www.tiarithfor.kr/enarhe/edngeveea.htm	780FN1Q368KOP	2009-09-02
16	33	19	3	47	XS5YG8IO8X3UCNSYJI7JTB7S3S25B4C8B2C10	5Y6JP	5DH	-1195193230	http://www.andedat.es/hisou/anarnotnot.htm	U9SV8EY9N8	2022-11-07
17	26	2	5	23	W	7P1E6	Y82946YRTSS9A2F59UUMCUX4N7086AGK44206BBVG9531199YU0I076CS3Z1415A7F	-532059750	https://www.foronver.it/atouror/andwas.aspx?id=823	AO24FQBN7B3S516HVJ587P	1971-03-13
18	38	34	24	8	VLFM1I6DU78N9	7P64	27016	-1866654781	http://teleeroul.dk/tiwitter/eraester/asening/rearitwit.htm	AAC4	1979-12-11
19	33	29	33	32	9C4	W	1T9720Y78AC8E032F2GN8Y9F9	-638715405	https://eseaourne.hu/heingnt/alion.asp	CFSF4VO1Y01S2K8U7B3	1998-10-08
20	13	24	33	45	8EM150C94I0NLD	ZSX11	47BWRVNT	-2133206387	http://ionernton.mx/ourar/leseshohis.aspx	1O	1989-01-14
21	28	14	4	1	7198	5	7PVP3496N3HQZ	-3631	https://ouonas.cn/istheall/ourndhehat.php?t=59&p=558	\N	1980-12-16
22	2	10	32	36	VV28Q9T19B375C	JHH72	Z	-1618757887	https://www.forin.de/leareas/itnotareer.htm	L1O0916X7V2UV	2019-07-28
23	36	33	22	8	45R	1I	P462	-1231576311	https://www.youere.at/ereoulme/waoritwa.asp	I	1991-04-14
24	47	12	23	12	WB6SNZ	5	3N7G06	-556477826	https://areonentuld.ge/le/asherthaand.asp	4U187AWCVAVGO348Z5969BPK2FINF55DFE40U26J3U7K8U912Y3M85Q8163V2FIU02435W8M0LK8A185JF2UPQ6YRS	1972-05-17
25	43	15	47	24	8	5AU	\N	\N	\N	9586255ML702L1PW77I8RAVO1712KIL0001ZZI8P6	1970-01-07
26	26	34	13	27	22F6553HV5ZR5NCU72KE690336ZID8IUDDO9G759W5ITJC0JT	L60	R5Y6CBS3R33I	\N	\N	AM537B721WZ	2021-10-02
27	41	32	41	34	OWFM8DKS8O7HW9CN3F4F8W7TP55V982ALJ787	Q5I	2P756H6QY9F80S52Q0G5	-546337011	http://www.thaeneding.be/ening/era/ereon/ealeverea.php?t=85&p=8802	DPMS5474GZ9U036F3L05H8366	2004-02-17
28	7	20	40	15	8586GR09FZD7X2H8	26LKQ	92K2T0760VL3O01ZAAF256ZT7AZPDQYNC7G0TN4ZR	-1655169076	http://www.uldereyount.cz/issenot/wit/ent/hadithever.htm	88WYU6UC405X9RLB2R5M80	2021-02-16
29	7	34	37	12	5	B59	1E1	-8	http://letotese.us/terthth/oul/reheruldoul.html	GF95WJ0L7R8W3Q0AOZ313E51M3SH3E5Z0E5IX	1988-05-11
30	12	36	47	21	KN5	274E	RU48YVJ1LJ7V5LST6RUH	63	http://www.buted.nl/oulhawa/ulderare/ea/hadheor.php?t=91&p=30	IP61X7PN3WIQ3P183J5YY5Y713QC	1970-01-12
31	15	5	13	2	02949VKITJG14U7OOPUV0	7	9	-622724199	https://www.arhiour.gr/athadhe/ones/toedoul/wason.html	44X71ZQD96JC7A9928FA0X32G2UP	2022-09-25
32	10	16	46	44	4DU1D	2YU	X	-207740402	http://stevene.biz/ereden/ionesin/andalin.asp	4L2	1972-02-17
33	33	8	19	17	B	516	4P	-114995481	https://hameanhi.de/ndhinti/enttiote/erhi/tedthseand.php?t=11&p=4751	X0FY737I14728	1999-09-07
34	35	44	28	9	BE	\N	C7TFP	-1448960231	http://itneternot.eg/butted/innotsetha.htm	Y075B	1976-11-26
35	44	10	19	7	H1S9EMJ57AGQ1204DCC05CUQRU6O1Q0I52LLY50	3SK8	8J4K984POW4T028685MRPJ37	110	https://entasingas.no/st/veralland/eretioher/enyou.php?t=82&p=2693	39Q2569TYZC64	2005-11-27
36	6	22	19	34	L3	3	Z	-94163426	https://www.oulasreat.nl/reerbut/our/eanele/eaerealler.htm	527FWMAO354DAUB3J9	1972-06-15
37	39	1	4	44	2X7	9	OQJ90QN48839	-686281364	http://reyouenttio.ua/notntne/hisallisan.php?t=99	3A35W9O2L8	2010-11-30
38	49	41	20	40	QSC5PH38I0KUC2	65	VE3TR4GOANO35ZFXV	-248217915	https://haalasthi.lu/thha/ome/ntfor/thitedhawit.htm	19H8S2L0T4J8TCGG0O	1997-09-25
39	48	13	43	6	85QKKW25K	E3RDY	BHBJ61T	-1321247616	https://meedverst.mx/was/eayou/seatbutand.php?t=57&p=3591	ESFCXV1IB56212G0H16BZIQ8D0NV9UGO8Z6D	2019-04-21
40	6	41	1	34	4F82	A44SN	8SPW42IG9011ZSUR	-965712830	http://www.ionngsho.org/edrehis/thaeare/had/ndngmeher.php	IIG355YD52Q	2016-04-10
41	18	5	20	25	HE5UO7W9	189	R222T1	-8	https://inverenthi.be/andtone/as/inganted.php?t=98&p=590	BYECVDD03	2013-04-25
42	27	30	17	14	63A	W8	\N	-1258858447	https://butionhadome.mx/youedyou/al/omeanth.asp?id=12	KV0	1970-03-03
43	23	3	12	9	X84562GJ51X219P511578H43320Z	G5	86948ZK0096059ZCIZ32ZR6J195R	-379307018	http://youtoingter.biz/eve/hatarittio.htm	XINGNO	1976-05-21
44	40	44	15	50	M7048SV5VCTJ9AQ87GL7MY5903JP7F205YMX09	9X63	FK0U5PU6QN3OC3MN289MU	-920399458	https://www.tohi.lu/inghadnot/sese/ithtedme/butbutle.htm#238	\N	1970-04-08
45	15	4	4	3	6G3H5XP9166A2	9B	67J16WJTQ07TXUW55I5V1NR	\N	\N	G3162QYMN7NJBZ3	1994-08-09
46	38	25	47	35	53JLVMIO7858K419I2FQDW4R3324KK0K0ADR	P82	S1J7REST	-1868052182	https://terhadouan.at/herehen/ouhaare/terstsho/allenteraare.asp	FC6571CM	1984-05-20
47	49	34	8	47	P542L9	28	01MS45Z1J	-1548597520	http://hadionbutwas.za/wasal/ithorforth.php?t=99&p=6754	3L64X536E5OO4	2001-01-08
48	41	36	48	47	ZHBBO6Z4EK3197A2R4T9141IR1824Y8XUEQG80L3FJ3ST35442	T0K2G	U2212I89W93W31PJ2F	6199	http://altertith.be/andmein/hineruldng.php	W	1981-11-06
49	17	43	2	8	84D58	9G49	\N	-885707670	https://foral.ua/henallha/al/terer/meourteris.htm	\N	1994-04-08
50	22	24	17	25	2PD0B9EH0	23	779AR61QZ3V8X3IHKL02MRG36HEN808NANS9AYA1	-1794008574	http://erith.tw/veuldle/heea.asp	463ZOG	2001-12-31
\.


--
-- Data for Name: bsc_inventario_unidad; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_inventario_unidad (id, nombre, alias, descripcion, orden, fecha_registro) FROM stdin;
1	K18TQ71R127Y	1	3	-1360574059	2020-03-31
2	96A0CED6HJ1Y5ZP94J8170ZA9K25FD	ZP9U	863S39	\N	2020-01-03
3	2356R3IKV7PC6AW	3	\N	-145350678	1970-04-27
4	4JTZ768	B	1K2M6M018K73F7S	-286315720	1994-08-22
5	0V79DT3T6IDJVR6K5VITG9172L9	UF1RQ	36L121G02H0R	-2086140314	1974-10-17
6	0A1UZJ72	G2707	IE2	-1906880373	1983-11-01
7	54E9H52	5P2R8	7	-145864143	1971-07-21
8	83S4PV2MVB167A02184EMA9C75QXIS11E	578	090	-56	1972-07-03
9	C81O79	W	1I03W	-91	2010-03-10
10	JF0KGA99LZ24N17TH683	O5X	T705H0T1	-716658829	2019-05-10
11	5	5	8O998	-1821398907	2004-05-26
12	3KH6H2G6	B3	465K8Y93FG6EG39	-443590315	1970-01-31
13	75R1	0	1H6PPAOY2UOX1GP86V	3098	2019-02-12
14	S9KU960HM320D2B3VKHR0O019TRJ8HNA	0Y	53RX70W9	-219604355	1997-05-22
15	9AEA0779	4	H34MBJ	-1105489138	1970-01-14
16	D	M4RY	F15105V	1389	1996-01-30
17	6FRASSGZH	0S	BNKBRCD404Q	\N	2012-10-21
18	EPR0	Z9	\N	-923543739	1985-08-13
19	B08725DAGGJ362T5STBBW3ACS504JTWBO36U6Z	9D	\N	-1497664312	1970-01-06
20	8M5T30ZBVXQ1E0WX	9	\N	-1748363887	2000-11-17
21	723B7RDY19Y0DVD5HY9M8R3UJ	N2	9FC2CKV1344PUU6W1C18R979Y3E5V	\N	1992-05-20
22	3UT	D3	TEWLVOR1K	58	1979-05-27
23	W4GC94T8Y6I4O	3	6QA9P5GW5O3XJ8EFDQ39K55	-1874041020	1972-12-11
24	4	GN	29711H5V	-8175	1971-10-09
25	D4TI5977YA7W32W37MSGQD0GAU9968U	4Y	\N	-343	2003-11-22
26	6E49079IP8C	717	L1D574022TRK41FH6DZKNSMT4MZ4P66	-2046077599	1998-07-13
27	A5YFD22PJ0	9N	9ZE1PAH476MIAI279N18T37SN8GR25BKKBM0W242FE02467RST3H899O1315VVZ5068FH	-6	1995-02-16
28	S8D6A29RO41P1A00H06FK0F7X7QEHC01	G14VI	APRRJ683	-835213159	2002-04-06
29	94BWX1	46	6ZN1941L3902652K04J1615P5C7IRVCGI3	-764043857	2007-05-12
30	37FU165ZH5G04U0M8A0P4	895R6	MM554552139D5Q5MBW8M79VM1F43	-295350700	2015-08-26
31	F3FTQ4YQ	K	TGY205M06YW8FB1451T3HK532836D91057P51D85AWY0	-317904159	1971-05-01
32	80	9W7X	6C0AH6M3	-838172443	1971-09-15
33	8AW322514E7SX9BY4X4J890H5	L6E	E2A	-88606210	2011-06-27
34	VZYK7HSME8OI7362C02BGXF5W092	9K2X	7RGMOS5H402JX3	-713299118	2014-06-11
35	N75	V	\N	-622	1989-05-02
36	X2EG4	QX	B5DQ4I0B	-517309001	1970-01-05
37	WB55SZ4EX8CPFQ509105LKKJF4E8SN	1U	38	-2073355062	1996-02-29
38	669FI8Y4L5J395	L	\N	-206744491	1970-04-08
39	3W3356890YXWB5K032RW0T6760P41K858B4RN7HBP6Y8U	F3	\N	40	2008-04-25
40	M819U03QX9N043KH6V1AHU39JL6N0F6K3D68QZE3979L2ZOBKW	457	GL55W6301438RQ8EA1	-1866501799	2001-11-10
41	584S4	08Y	GFQXH7L1YM2F31UA588	-9	1970-02-27
42	414	6	C2R361JPN70FHXR0567TGTO8722	-139476745	1978-06-15
43	U97497366RH44E4ORJEAD73	6	\N	-303119868	1970-02-23
44	70520M1QSTO7JX2804	58CO	\N	5749	1971-01-18
45	2NQ0230LN8JX9EN915	6U0	DL7IK	-3087	1970-09-01
46	84	KNKH3	O176CMZ91B	5363	2013-02-27
47	O652H6CC66U9S21QAK	J1E	93SRA2R14	-3	1976-06-01
48	EPW6UHAF639X3H0B63ICU8989	M7O	Y4L26P6RKX68X3SPSC0UVP566D80191	-2	2015-06-09
49	QV7Z6SV89Y68F822F8W81	76	MDY6K44A7	-1935617048	2017-10-22
50	S320B2GVU94L9G124N4642P	PF7	\N	-64894388	1998-06-04
\.


--
-- Data for Name: bsc_kpi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_kpi (id, bsc_proyecto_id, bsc_objetivo_id, nombre, alias, descripcion, orden, formula, fecha_registro) FROM stdin;
1	10	18	F201D4OFXJ8QSD0EMX466B2WGM77SAZ5477	Q0	81K27080VOK80VQ9IP6	\N	7UF5D	2008-04-11
2	10	1	1CIY	V	9A623Z1XQ7IIV08UG26Y9KXPKK	-599382977	851DK7	2012-07-07
3	11	46	IOBTYR2W7183X5NWW3Y	6M	98T12XYJ2Z4W71W54OW9U2TK65Z	-1558087107	46KNPDJN74QR3F1LI	1989-06-14
5	35	37	3	G	05G6I7U6TK	-89948970	R6VJ	1991-10-31
6	35	6	9EHG14QATJ452KL2M5OFENT7S	9S	8RT33NCC	-1463700094	WO	2014-12-10
7	7	20	5	MM	7R1O3X1144MGPKWG0J8L1B2HRDMZ92I6MI1	-782787959	9	2018-02-03
8	5	20	MMJ4N4Z5Y79X8MU6QASXWCZ73J5120VW4E02K358PKVHXDHL82	\N	7	-559690754	H85LFEW8DSLVE73	1970-07-17
9	29	22	6A02YG6SNE29769T5C8TA9F3MA6	68	26U273	-1	73LG7GW25GYL7S608R3	2014-11-27
10	14	32	HY9U3KJ6K7CBFN56O02	WF	Y65	-509434008	5016NZV63MOGNVQQD002EK770S4W3917941KL00865Q4	1977-04-09
11	31	10	702DDEWF	7	RLN9P12P94L	-94387014	44G6O4RQESL1VCJ2CRTKKF085L221OVVZG4	1974-06-23
12	36	16	9798P63GS65AD5960QCUW4WEQ3SJSD	896F1	Z494214O2H622	-1476611773	T1	1985-05-22
13	13	6	6NV08	SI4HU	KQ5QZS3A7I918B820KX6	-1677741864	8XG7E3950TZP3IXI6PA7IA0C77320S3E717PA6IL0N8Q4B	2007-08-02
14	21	35	05	4L9	FET93HEZX5EJUSX548ZXV	-444154686	Z2E11L19X1C97X	1996-01-08
15	21	17	6U44H6M32BLS08515XMT	0	4	-280694610	4	2009-02-26
16	1	13	0X26RV3DZ074IJ316TOYR9K15P00QG6A	74OK2	UFFU33G	-1135043815	5O59B44TDF2	1992-05-11
17	31	43	YX	A0NY	EMBX5A7D40F751ZA9G99	-1029320644	\N	2002-09-19
18	32	8	H085PF1423UA	I0186	0DXX50113T2EJB9147OC5OA42PN1HW7TNW	-325571398	\N	2007-01-24
19	20	28	WF8801W6AVNZ7G2POT561V3RR32Y21V4EV06JQX8O4D6Y	4W	7J6	-1662410686	33UBR743ON313108L0RQ0S2QND96RMA4WQ78R3D90V	2016-07-28
20	42	34	3L19OYT0INTUV2YWX	3X	38P19411YWJP7L4Q84M4	-1448783861	0R98128127R5MQ4	1981-07-19
21	18	26	QD8N	A03	7ME6H956	-421	9I459ZL	2012-01-03
22	1	45	2E0T882N6ZG24V69E4U685QI2TDJ5NA5UZTB854JQW2L	8	19ZLGS95T229H	-1562317690	Y25963W19BTO	1970-01-10
23	48	15	24X37K31S4LW3TL4KD95TM6C24PYE34PXLQ9P	9ZXW	8T3UCQO03	9	0EXTV281141M19HDYWHWLW8MM7802YWI6	1999-06-17
24	44	45	YMH6G081YZ262R18BNLXCW9X390OG6866NZ6ZJ3H6BZZV6Y74M	08F3	7A6	-1111872394	2	1981-02-24
25	37	10	3557O02WJW7V0NIW625Y5YU1	X3	2700R	-1864233058	P	1973-06-27
26	4	44	835ED4IT669IYC0V7BG4GDGOKIT856VO3Q0TSG4DW85AW6IMU4	2X28	\N	\N	6VD76LTF1OTZ	1989-12-23
27	34	6	E19K4	EU	LVHEF	-436477743	U	1980-07-26
28	26	34	149RN383	J	E30WON41	-7296	IQ58	1979-04-22
29	39	28	9B20NCEAL85T87	91	\N	-1937146433	U6IT409217K680R0W5B73C	1972-11-27
30	37	25	S3TAB4FM8E4JWUMBBVU6G65579LH51C5652AO6I	QBIQY	23M16I3OLYE	-104211460	G018YJG	1970-05-21
31	20	20	RRVI0SL6KY0FONJEIO4TB5XO0289	84LH1	20L0FM2H5YA9U2J	\N	QIL6FH042C81Z938E81OIL9M96PQ714Z8FL626	1990-08-14
33	1	8	RR4RWBT87775736PY5Y0T15RT690U	F9Z	TI00B295MRAA15B705	-140	60C7HB0WTBA8X597H0A4M5Q3H1F6K353	2011-11-10
34	34	8	5519LRHAR553KIDWUW1JGTC078MI9UKHP	L	K909	-1097423728	A4H373ZRO6W8262M	2022-11-01
35	7	26	0TV7DEE3L38OP7L610M9EJ4EUP2G3WI500F5LYT347038JEC95	5EC	5XE3V5474Y49J8N	-1844020005	\N	2018-11-29
36	7	28	XZYYR9I1GG938H5J75Y0G	0	R	-969443631	R8465MKNA88AM304O64AE5F	2010-11-07
37	46	5	VES08Z22R97YY01I39O377ZLQ33DEF16O275JM55	Z	P224S6T	-1602541421	K8349Y91U9169X80PZF86MNI70BNRPZG5	2013-07-18
38	18	20	6MPW0VU4UYG32411NP34PMAZ76VM27NZR4YD3TP7UM88I12	GXF	N9FPZX76N1UW0BQ1QUANE	-1834281272	1	1982-01-09
39	9	18	WD443OIP83T3GG8FREU5L6LLYI269199YQ	A	CKV17U2234ASH	-1375221000	28Z31XF8LK0F1V1MT0F	1993-10-04
40	15	6	2	R	2Z2AZRX7487L216T7305FGHHOY569789906F95ZZ1650WGRU93	-465153655	LX0F04698K	1970-01-04
41	19	4	ALDI51F2Q3	U01S	930HA17729U7T5YE5A050E010Y4D1GI112DP198AA4	-736452340	3FEIZ4O14XKZ8O7Q	1974-06-25
42	21	26	SVWJ	T51F3	55XDQ048M4111UGYXV258M478EY3882A50Z7G813BX121IV0HE9	-475373081	D08VLP27GIMY3KCX9E71S79VIP3AT59BS1P1G8667913	2019-02-23
43	3	42	4I6D2G94MH59F679241241N104V03	2SF	XBN66WBON4087HJW6ED2I0NZ	32	YO2YW3X	2020-04-02
44	36	33	1LTS99P958	ZKKK7	O0L	-1741706279	9E664	1972-07-30
45	31	7	XT268FL7JAQ0P7K55S11WVWH3ZQ05PNI2	V	DESVB7D0SX8DY43Z97EQ0D0Q3	-1137387767	\N	1988-12-17
46	22	18	PVI	O	B655RSP47R63QPM2PU7GJ7K4616O77	-1097828933	5R	1970-01-04
47	31	5	QHW453A	1G6	4QJ633	-9	295D352	1990-06-16
48	44	34	E748HD9AM16552W5Y69	1	VW3EB76AS9SNX4V	-1737131369	7PY4V891J	2009-11-23
49	5	12	KT25E3JG495TKBP2A5O	H820Z	I14T35	3	A26FS14IXD1I50CP6BHJ1XGRP890N75PV8T8SUT4OHA556QUABM39RPEGS	2015-02-09
50	1	49	Z6W812RSSADA3QS9H14C9CZ3PL0JH57EQ8S96CMI49434ESVF1	3	05E5X	-1825713468	AD5	2000-02-03
\.


--
-- Data for Name: bsc_kpi_meta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_kpi_meta (id, bsc_kpi_id, periodo, resultado, evaluacion, x1, x2, observacion, fecha_registro) FROM stdin;
1	33	GD5M	0P0PMBYR6TY6H2K0H3Z	79	N	H7I2K	6P46	1972-07-20
2	18	ALZ3	4W4I7EM000C460W5O55650A95K5OZ88PEXYXA13TL4MZ8QZ43FOI2553VXE26045T3PXO	4DB97NC18435G9	P3P3CB3GG91X8IX3HT0KT493R5H2F7N3919	14	74G	1995-09-22
3	40	H1	\N	7WN6M4IZKA09WI0O	FV1X982TY2U05O5	26I1441C2S70RNMPUAK48H1963OQ2UL9X936XD7P8H73T5	S4O14Q849C9495BXI4V2Z1672S6OE7IG4XIEMCD6BPH61I48NR1P9U2LTN2Q9IY3	2006-03-24
4	15	94365	\N	ZX2839C	I5U6	\N	RH80RK7KXS601	2021-12-24
5	28	2	30954N2QB4Y	TCWVA48YE8KKA0J4	98FA6GL8U5JW8BFZ8SOEAVC1V5H4RI5WY5E3312ZV10W0PK0P0GOSFB0JO0	7ES66XPX3RH4	TQUMG8FMA5046Q3KH2G4PRX9I39XC7BG8040	2020-01-24
6	6	D	095H6857NV594X8XLE0279EO	8X8Z8J2FPM06TNPCFMLA9JD0	X601	38LM	9FMFY319Q4XCG73UC0U682V96FPJO	1976-12-03
7	39	516QO	J88B4M0GAY	M6O18GY9FX	24399UR4K3M847TG059M9V911	T	6498X140JH0R4Z807F	2018-03-17
8	27	HIJE	16GGI76	5514J0	8GUKPTM1	E9078FN84GO23IF0B8SG	JD008U93H2W5S8J4FF8T34510A6ZP57OHA6R0W136D05251044T5D3U49974IA494JWVEDOI20VC	1998-08-15
9	49	0	09N5M98B48BN7D8KYQ59V3707DPEH6GC9540217011	I	F	HGS6	199BARF3	2017-03-03
10	37	1V4K	AOHYM15MOO2YVBMJ8XKEO018SWS38B	461062930	498TY3NFNXIFAEQ03H6H0L0CPTX7DX567	3	2LAIUZFIO4	2012-04-18
11	20	E6J0ZV	867B44	AM1U9Q1Z5J87982O02ZP70S24YU5	316088375	L45W8OBL28Q	R99Z43C8X6J4KW5D2RD	1970-01-05
12	3	76L	\N	T3H808TT86A4B1202104C00	8	PE2DT87W7ME7PH18SDZ0N234QT2FB	2QTMDCG26L6F8M9NXKP1E4	1997-12-29
13	7	P	QUNE2179	PT18	4UA948189L5	32F44SL01J8723	72B25HTS7688995	2015-07-22
14	38	IX8KD	DP1C4DJ0LBG4F3AA	3H1AEC89985	QO7QF5Z0Y	X326H8	XZ4M919800557	1991-04-23
15	41	80	689C1RB69822J6BPEC	O7HSFLP3SM4U82X0B48	K305BR329ZPRY5G	7DH71D8727U07539ZB09H4M03GXE8389B1WG	508B6	1970-07-02
16	13	O3	660	8BE2XJNT9X5W3TE97J4TRF	B96V854G4005X	XL2AL3L9CQ3812W34FU9WT4J17W	2J5G	1982-08-18
17	15	M6U43C	G4	D9Z54UW16C80Y954C53OB1JVN663MK8Q612116	DIZ17	1W4V5V2RC4Z62Y3JD81ABCC4JKBWM17YHIQ86077T2DJ41IL8V73CUT8E321YIS71T2D4SWF37EQ962WGP535	QHJ21KP34W1V67411T6X9E8B0YVNM030I98F9EO9IA559512H72112O9CDOCR7UMW6S259405275B7DY3O434VK539L5TXYDPO98555VJZ	1971-07-20
18	24	9K	CLJ27J4J2H8PAKXPFD	1PUY5JB	2M7IU4LZA817PMY	HP1S568	L01X5HRNGRVD	1980-06-26
19	28	2D	0B55U4JEUG71W09Y2Q5ZZ7	62589	5TOC2UDO6I4T2	P005R0Q1PO85X036JT457G528QE3BR02HZ207H5X85Q307P35D594F0QKWQ9667VP6SLC4VC02C932OW7F4SQR7G67NM849YG649WO5355A2N4GOU4V9463T7688932999DI9QUR80A100JC55OQ372ZN	KKGS6T3CGN	2002-09-17
20	18	W5F	Q5D7E38T8R86SNA72Y95F47E6VYD2I6V0T5R631S0K72C1796	117844GL06UQ6YYAAL0MP3R	6NXDJBV7SN05U	\N	3M90GKOTW002SW2	1978-01-28
21	6	S	KHY5D5863D8XUTQ63397	JTA456D27F626A4S7T8299A92VJ71	6UL375T	82Y1	\N	1989-04-21
22	16	Z9ZS	L4C8Z2YWI6D5TI	PFHIJ9	2H	X2M49M0HV8M45	6331QL5438W83	1970-01-10
23	31	M3DP	1IQ0	09XJ9S3Z	1W0	T81Z9EJM7M	784E019S71CM6ORE5Q18H8G21W3GZCB7T61	1970-01-24
24	20	B630A8195	691YU	\N	W4SW16627	9IAQWP68IV6Y3KE1280	E2KN7471BJKO527H996MW4	2017-05-24
25	29	O0	S5ETTZAA2KG3U9MYQH89776R4R3E4FRJI54MQ4JU	19TPYU14W	8KTUK24WJ00ZA309DUBAZKS64R3EM6NLZ0BS38UG88U3XI26B0Q4	ZV2RN98A160	\N	1976-08-14
26	47	2	L474J0CBZ0V97GS	219	\N	OET64KZ93GCO2ZFER0P9O4M562C3248B85HC3Y79LSVQ3	618JWEU97Q2PCHL168G5B9E2Q30984UWE4	1994-01-18
27	17	97	\N	52ANR44Z	UD9TIZI72H1DPB061HP	W3RLUZA85131	99Z78K939E	1978-09-12
28	42	BC51	5	AOTGP	\N	2996M9	CB38UN	1992-03-10
29	1	LVK	00D5FDF61I3XGYVR27EOQHFCXQPU	41GAS0L6P	5W6WB86AX23LOY8AXQR50N3JCUL14I97566H7WB3T10ARJ3B6M17OF1	J414WB	OS4N67Y2Y	2000-02-03
30	37	O9	CP8I61MXCL3QQIR506GN23R85Z6423F	\N	43TMWKL44137T54T86C4751006EJ	OKW71U4	8988O1JKW0T9QHO3A70AZPWSRT	1970-03-23
31	19	OF6	963Z0JX0MMA470Q06GY94QT72164PNF0C8RU802B46E	B	O18UJD230B795NF67C346UFO03S6WD21582U84G08O20A755S9EQU7C1MNBDJ686PD3K0W8APDU	K	7KOERIR55XOECMTL4Q0488T7859BH6HO86S1541PRGBD95IQ2PY4B7AC34HW9HFWC91QB0B5X8X39O1V	1998-03-27
32	6	OX7UCRU0	WX4166CTJ9WP2G6X18G0O2	K5	L70576XMEAR485	33G958	3S266WNAYD8673X96QT1SJ8WYTGC9N	1971-09-20
33	27	V	\N	Z3705Q3V184	931663AG5AJB7F60602F	0S	2YJ6XR6583R0X53EC0QX12O6KQ8AY8SI5XUC	1974-05-05
34	36	2SN8	5	60F4DNTNV6	680K8E5X26X21O1OR	S9	I5DY6JE8UE	1987-11-08
35	21	J3	0ZDH6GKO6L5N5	9W0	M2ZYII34X81R0I74Z337C4RRPCRD596MDK1D94L9VZ5RU8D74	74N466QR3U1WBL1832VV0H1O9ON99SMC8YN8TIE7Q	BUJB16P7433TR42RVAB9HM9G7835AA9A360S4E4B3F634IX7	2015-05-08
36	46	6H8	XB88B27D	RF2WK46SJ	66B58A8OAP6K06	88X55217	7W8H52T3S8X9COM4F85K26O8O155L06	1982-05-30
37	21	6A	J8I5	X1Y71UOD0774XZGKE	A	35BQ94OR6S006U2CW	PA2JW72E32D6A4I6D7154DQ7S1N2	1998-07-02
38	35	7	SUA	1UCJ70L9PG65G87649563SLI	K1912I	L5	\N	1979-05-26
39	40	97CY9I42	0K8P	2NMGC	P64MP	BUWHSOQ56YJ96G1PCTXOHGB	2M17B32970Z0DQ5GK8VF09D86J5QZT4STNALT946Q	1971-08-19
40	1	3YDQNBB3	2O	43D51W02499MQ7U47S96	2FVGGI70H	P89	C	1977-11-18
41	24	BBK	K	QR3	0W43	\N	AF7P7	1972-02-08
42	17	3G6S613	O50	U96X9KXTI98XB6TMOF	F99717BEA	W6ECR9JE	1BM9OO5X	2001-09-13
43	36	O37O6	7F89B	604OG13YPZ	XJ196I3IE4HRE1HB7458568ZZH8Z57C1762W54AGUWY0F25KB	0Q45RPI44V	9VL68K913319W127L0ZZENZC002UIBRBXAG37E76LR99IB47ENE80WO8R7TN4H98Z8TCNG371YSBV314H6	1996-01-04
44	25	9HQ	7L32V9Z976R3OC6ORL30KWCMEE0ZU6GRG56RX5X946W0NNI	DE	SC3WJR1ASWW705MTG83UCSWJ703	967PNKM00JNP	G4E5242ZK6	2007-07-24
45	11	70	9Q3B	64LY2FK	NAF1FK5V4B990JGZXH854Y8S2E8SI395182Y97J	4P6MU24JD1E44231V	Z46R0M2X2572J9ESEE1UN1YC19P70	1971-05-13
46	35	06D	6U262F	ZS8ZFFB3Q6QKCA7XKY2G8L49K289WH38760KRB21F1G9IY66XO94330M0	\N	I2033	\N	2022-05-22
47	44	32	W	8ML0HVLB4U95537XXUFYMC8XF537B	7R33	A80448J9E579UI53QS502F77Z0TTZNSP04W61AT9	54478JI2I2R9522LY8134	1970-04-04
48	50	8F09Q66QJ	1C	\N	EQZ36A	\N	K6GZ9GRYQT8OKD2WTMC2X0N49IBC8QR5267CKFEI438706BS7OE61P1I9H5VEA7B5ZM7KS0582V569VE821D	1981-03-06
49	43	ZL	502SM7NZG93DA0ZVC78	3	YAWX78X	5I1T345EC8E2TI03187RUR1EHA3	\N	1991-09-15
50	36	967327RP	95N3P9LA70L661HBF7I3D1RA3W	DD31920BDO1S2E9TOGFT	8TTODLGH5MHIW1C8TJ2J71SQQWY1E6YK7RSP784633T9WTU3GH	FH	VHH	1986-02-26
\.


--
-- Data for Name: bsc_linea; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_linea (id, nombre, alias, descripcion, orden, fecha_registro) FROM stdin;
1	864	J7O4S	U58	3	1970-01-01
2	1HE7AFW1VJL1C8EW4G313H	7	14Y10MUHY0XT8B9PXR9J938P28T3GPUX50L7N4HZX00CR0XY9W	-2090539160	2000-05-29
3	54Y2	X6U2D	W	-1298511159	1976-02-08
4	K	7	RZ1B0W	-730023638	2020-09-20
5	SCNS345E18HO37BG3102IHOR3I08NG19OTQ1UP2XZ92II0A3A0	4054L	Q0JM48L	-598152306	2013-10-05
6	UCIFP6YY8VEA19469470380OJPP36V	8KG72	J5LJSQN	-497829609	2001-11-05
7	7I7Z2Y4FOT1WF82M30M0X9XGE7KWKYSUW6D3BNFSQS08TF83E3	J7S87	5CH8YSL	-1272245938	1994-03-26
8	0C1K158CQ02	R	E	56	1970-01-06
9	Q44NSZ198HU9D93QYSG9U18A95	Q8JC4	\N	84	1970-01-09
10	D9W9YS3B12NR3EWW5Y	C	ZXS30	-1979878984	2013-07-30
11	ZY96	5B	B6H0CQ77	\N	1970-03-04
12	2VS2OH65	VL0	4OD87WV95	627	1970-03-03
13	4	J	835I2091JZ	-353753083	1995-06-12
14	XM935QV0C5LL0A3T5U24RKU06Y693M352K9TL6LSNRAMDQ2465	0I331	138897	\N	2009-08-09
15	I418A0TSN64YABJ6K7	BWM	O9	-1171149210	2014-09-09
16	9I6Q9XPY4MJIX9	\N	685DM	-281018203	1970-01-11
17	X0544NF0796IK0JIR18X6Q0ZI36S4H2WM41B7WT68NA33734L	2	Z	-1162466197	1975-08-24
18	875IS7BYJ94QB4ANLS2791H299530425	9QV2Q	ECWDS	\N	1988-02-28
19	049Q1XT4TUG1BE	277	4E	1055	2004-03-17
20	951Z470L8PHG1	245	VULXZO6H68Z4XH7725001XO80HV9TU4XT667K4B9D	-1120074977	1970-02-12
21	S5QXRX584J9KY3Z1L5CC	BZ	1	-410296410	1986-12-16
22	M1	0V	\N	-2030953029	1989-05-27
23	07673GB26L6DK912OC5	8	03WGK57YHI5R97Q	4209	1996-04-16
24	D7S31471RFYCC9N196FK988394K79AEU7JS8TI06IV0361	\N	51REAV0Z8770W4VNT4G	\N	1987-05-30
25	2ZRIDDM2MVBVPB	N	DGN5QZO	-1578238276	2020-03-03
26	82H	2	N328ZC	-708	1995-07-12
27	W908D257ZQHZOUQ9YPBI6HW	B	KFR3R586T951P43H6H9M4	\N	1977-02-10
28	G142QT4G79M50E5F31N	EZ	P42	-710298885	1978-12-29
29	0	RC	JJO2WUS7BHM9Q	-616330979	1985-06-25
30	41OC52FLD4S071G7308	54D8	VJM5O4L337C8Q0L838FONT887F89ZD6K5U4PX1UF4NM9O5WJRO30SW5W22K09YJZ14Y0O2Z6A690I3Z55	-1433476561	2015-06-17
31	9A0G26J	84	52L2461569SC1EPNLB52I335038FUI69445GR322OH9K8307DD	-143147290	1971-12-12
32	4K61	2J	VMCRGI2	-1721783868	2010-04-06
33	Z7DME9395Q02OB6KE	1MYKI	\N	-1277290054	1995-11-04
34	P8H9FDQ6AAWW3S6L9FAGMBF6V26	4	7	-1335645343	2010-09-24
35	0E9981H2Z	8	\N	-567437996	1995-04-09
36	HNC449O5VD	BS6	4D1	-71	2010-03-10
37	RZC93X6F73953FQN	\N	77	\N	1970-01-09
38	CEWF2RGLJ842TF7KON4XS17R4Q03O0WY47LUZ290A8Q519RG42	2	NH40LIO	-1042030759	1971-12-21
39	OD949XS832JZLYPU6M8	5	\N	-9438	2005-01-26
40	BHXPV6H6X	7TJW	UQK09H0XP4669Q5605T38I7MUFUPFFTDVPO	-2016898460	1970-01-02
41	92W3Y48DIT70A079L0H4GT811H0ROBW4ORTW01O786MILTKRUR	3G	04L2Q9T5V2814JP19TU9X70RIQ4	-1254014531	1999-10-24
42	1RC	7TN5	ZHA63P	-152321114	1970-01-05
43	0PYQ901GSS388BR3JNE9H88422V4VSR87C81MN0M5X	109	O	8	1970-02-26
44	QTHGHK1	V	8K54J8D547BXEYK5FJ23GPU0	-71	1984-02-18
45	4D13E58584O8QEFOAIX7AG	51	54P2G67FQ43QF85N4EP97B2C5Q851B77QL	-452053907	1996-03-11
46	86HC2M194EXY	42	88RYX51	0	1984-08-29
47	B9I6WZ	L94	JB2SH18P1T07C50459U89F5503I4KH83620C9N200T7N67X0Z697XO531S1191G9B5210	-832494209	1999-10-21
48	CEGFAF6998924G88566S75	0	ZQR825CZ5SX6E	\N	1982-06-10
49	D025SMHIT5GK3M0L285CL1C6TH43	S	HGJ21P629S5	41	2022-08-01
50	1PR4H24W0	8DU0R	9586A8A4R7Q282I7V08599OUKG1976V0I61NW6N8OC7LXP6D26GC305CA0IYG41G5V37VAY7N7J2847	\N	1982-09-22
\.


--
-- Data for Name: bsc_lugar; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_lugar (id, bsc_lugar_id_padre, nivel, lugar, edificio, area, piso, subarea, fecha_registro) FROM stdin;
1	1	-880027700	1JAES702AS	9YSKDPKY29IZBG8O2	Z87TV556YP4NK2P98I580SB391D4PVG07FC3W3216QVI2U	-2057953104	3ER74M1CAK76827335	2000-02-22
2	2	-1237494025	CE30K	KNRFP5M	\N	13	9G56637HL3H8XWHMW61BO689633N6A93T	1993-01-13
3	3	-1503667975	51	M88Q16DKVDJEY18839	1NFY37WTQKDTON69	-3268	2W87	1990-03-25
4	4	708	X667OW002WJ0	8FL63O55B423OU4M457S25CF	1U27KCS7O1VFW3B2OFX2	-1252141232	9BN083O6524RM0J9S5MTQMXUURL647DY016J7C72F129C0MHFP	1970-03-12
5	5	-1048650424	QYBI0QP302403895PTNA9H4437OHVK62WW1H84TSU2	6HWJ6GL9R1	Q55MM151609Z566	-2045713596	\N	2000-04-16
6	6	-1542031234	TQ12G51URHP85081OBA47633DMXN950BCF5F61F8YV62526Z70	\N	J5NXZ075	\N	ZVPN20ER3	1995-03-09
7	7	-2041217293	5	51	9L299H2K3SI2X01LM4H062645FQ04F1546	-45	\N	2015-08-03
8	8	-1427532365	H049TZZT8VHF9	\N	1Q0801	\N	D41NK7N42PH092	2010-07-16
9	9	-1566134516	H6NB	5Q	508J0676F77710BYI77A29112EP0ENYO1N7K33TS	-5607	1520R	2014-11-24
10	10	-8788	6A47	05A59	0IZ0V30LIZ8B89YZ1W0H4279DD	-1302707293	1H52ZORUEHEXO88X6	1994-01-23
11	11	-57131972	A0WP97C13L18EM645677H0	CUI7GQLLCGLP1N91VRL022B9GB966K2JV2D236097	R63NS3BMM39LACK948KR08P7T	-405123311	NDML6457S7I86SKQ9MPFATQ2378	1990-03-29
12	12	-204892992	44M5EL6	F82N02Y968	67L117NR	-994262518	X	2015-08-13
13	13	-1768601707	E	AT0PFE6MJ8I43IWOBX	M7I78O0698N5	2	08BX9Y56	1989-09-19
14	14	-2123380366	78954G2R3L5QU954D705VV7SYV1HYMO8I2U98	Z08U65	7L6T07M325NGIV463KPZ5VB17EJ21Y1HY7	-245556106	8533	2007-01-12
15	15	-1778631251	32TXB	\N	VJN34X3073O06YN7511G91OOV3	\N	LN855343WGAMX	1970-08-22
16	16	-2034999787	2X50QCD2FE716K	B57AK53M3Y91W0X7QYFB40S6D9V	76DX65W	-466975274	JB3WF7B	2020-08-04
17	17	-1903809897	1IDT	Z313141L0RY6JJ2YMB5	5EIB43I1OLJHM83N5YHXL36X65A0DF5R75KH14HK857YIMF84U	-17767788	M1G4I6ED3U2PZF49080I796725MN3QWQX2NR8O	2003-12-27
18	18	-1062171654	IB937H59C	BTD111RNO1A3U5T	37LF57R151IY59IJSQ2L4LYPSP3208GVH8I4U599U55619KT6L	-1474316115	\N	1992-06-11
19	19	16	829OKH7475X5TONBSZP9CRN53S6FO5HG570H10CNN85DA52U8W	35AM6737NQV520DJ5	IBF	-1534830649	2T2D6374790FJBC8X3	1970-01-02
20	20	-87	FV1K2165307VQIHPX	7PRZ7P1	63417EAT2BK6	-531040849	VM7YW60OZ	1972-05-23
21	21	1240	6B78	09I7ZDUE4PT3O	Q2KUJ2V	-1448159059	35PO3IET6DPJ51P0VQD475471B4A17MP12G3DF5AHAA	1970-01-13
22	22	-940273079	J0NFM6A6P46TPDW4803370148FIP	36016S87G0W0F7KZ73	\N	105	I24UWW6DVK53D7LIU5	1990-03-26
23	23	-1468739851	XNJB1X8HCNYSKZL12P	ON3G04UF4081O31DF8J1P85MFY0BZ7X9H9N1R	\N	-918723639	6S9255881ZX8BP9HZ44EI7L745G56UL6VG3G5TAU54	1994-11-01
24	24	-14	40QL8PVCVS1F8916F5R47D2Z4P93NY	\N	WG	\N	3DYH43K8466	1970-05-30
25	25	175	9	CW6V64K0T12Q4U8TK8T263DPA5DAW	QS	-1079628273	H6KTIIM8Z6O8P3	1970-01-02
26	26	-529381214	68G4E7R9C8QBGCQBU5093OCF3C1Q3MN68JV9ZS49028CUV510I	H2469YF9C9A109XDVE73EH829	UE0OGK0S	51	V5483LP715B0829EYLNJ72BY6J87I330BZA9DMX6H20OP1DE0J	1987-12-29
27	27	-444	1O9RR1K26613JU50493TE75V2G06	9AA9ZEQQ1Z01ZWM0EB2S654K3JD86K35N535NOYCK4YC1X6AL2	D991YT5KO7J	-9	YRA0T320	1982-03-04
28	28	-1803288673	B3XVXE477CNNDCB85GYP0M056N20012V6B6M6G4BAP863VF0QN	DP1Y	3CO37YQUX657F0760T3G01OV4UG5IXHX	-1154168067	0H	1997-03-02
29	29	-752136693	H6YI8I32YCTII86	OMQ3KRGDHVBO5G6IU69	R3	-70	E28Z	1978-05-18
30	30	-1078400957	4Z54PQ0	239H	9J7Q9JCXU2MM2E9X765S6J9YN6UG2IF6KRYOT67AR2N0FNV3GX	-1300911931	3P6ZG	2019-11-06
31	31	-581	\N	875V2	C71ACS8	-58	E9K42I58GRW5Y6O	1985-12-06
32	32	-962	HE	B41B	O49GO1DH2O8TNO76EA8J	-580553231	59QB689P	1996-05-11
33	33	-129917365	UU4	CIC9	M4WR474D0TWYA9MX295D7FJ27ZX81OUMYE7U4OE3YO	-1096970874	56Z0S60	2018-11-12
34	34	-1920931898	D36U4DDV	S9	2	-2103930497	2	2022-02-01
35	35	-4573	KF55U819679611	N3P1CC1YOB6257B7W8Q00C9ZA6R6326EV5K3K6TOE1K45	21424DIJITN64SR7H	-5170773	674OVRE89	1982-07-10
36	36	-1238628709	\N	7UL9	28HR	-1568079284	653L0PMV43V2T2YH0SR27Z4769V9	2020-07-11
37	37	-178289369	1517S4KF70M132GND3VHW732WEEYZ1C020M5DW7F25V4C	NDHL4	7P87X41TNC4Z839GA061YSF82F5Z2XG3VC6Q9HUJ353H	-438280475	2KZQ0TX01KBVN3601X	1996-10-05
38	38	-1351721406	5N6D	9RQL	9D9IVQ90VO6SWEYX	-2099996075	4	1990-01-22
39	39	-689378148	\N	D4BJA0FJ5Y0JUOPIVCEN4SJE9ZPUKO90D9VJOD4ZD6162H98	4GDZ5M98CWN9VWVVIAP58C7U4C510H2I	804	T	1991-03-19
40	40	-330340475	QEW675CA	CSH9GTM1O0P1R8K22	L2K0WJA2YB24BO	-575382459	8695WE02G8S5U0CB	1987-08-19
41	41	-346488775	\N	1221T	EAT7R50G47N6CF668F45435O6O4AVXNC5XYG9I46864	-1676375238	6U62PQ4H597JX5I9V570	1980-10-29
42	42	-538897206	4595HC5759ZRX224289X06942E	X5	E1A8328	53	\N	1987-04-22
43	43	-792563703	2O5	5L760MUZUEP9SB3UNA746DX2TLPL02OAL7JNES99RSU24J	HIHNK1W	9	760Q04T7HLI4R1F9V3060JQ78BY103SE	2009-11-11
44	44	-510	\N	EK7	X4FR1R0Q5	-240867754	VO5SBC4L0OR	1983-12-20
45	45	-1995432542	84E4PMT4711251N251AT916U	WS6U1XHTQZ293K1T55X7X9741WJT0MBTH01Y9D0ER0H	\N	-1898936079	Q70X4J70BY9	1979-02-18
46	46	-1005232632	O0W7688SZS3822S356Y504MFVIK756C8S9ATJ32312384S6D40	5C7KKF8HBWE69WP2PUS137Y340909S	TGG02257UIU7D2L7PL7JM3U0I1H3N070UJCUT9V4D4UKJ0S7B	-1476562283	IF9H5OO5W00	2022-07-24
47	47	-150480943	WJ0	I857S26DBE9SZ55S2NY7SV5HI39P795VO698C224I4511L	Q1O	-1779862421	\N	1987-04-10
48	48	24	7L8RO8E78Q5H1I3Z0D4O9B80NWQ04RLX819S3	WY	S3Y3IR3ZI8X	-746898554	1	1970-01-03
49	49	-1156725519	6FP3X8M342KFL374U6R0IZPY15X8654VX788UO7W7J9869A2UX	451ZNR2HMBX4Z4WUKCZD8Y2ZA2MTU736PD2TBPJ42218G22YSF	L57509U963E3N2ATE82830UIRG	-3114	I4204KIWDJ9IM7ZU71I8T9CY1TQ1YC60K	2014-01-30
50	50	-6	Z0N4P2526S0773316	43GH9G7LBZQY6ZFOF	8QCO9561QE59CQD3M76	-1192974425	\N	1971-11-29
\.


--
-- Data for Name: bsc_objetivo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_objetivo (id, bsc_tipo_objetivo_id, bsc_tema_id, org_departamento_id_responsable, nombre, alias, descripcion, orden, codigo, fecha_registro) FROM stdin;
1	40	38	39	63G5SU	X	9U6K2Y	-1296762022	7P179	1990-11-28
2	23	16	15	L6O4G669J13	H77Q3	X72LA3J4EM4M	\N	OLH	1976-03-30
3	43	36	14	3H7UG4PJX85490KT4NP3G23UTI	KI	3J2P0M7	-973658950	2	1970-03-18
4	41	16	25	CHCTAZZEDG1P3B0	2A	Q01J47	7691	8	1983-04-22
5	26	10	44	TA6KRM09ZV403J0N3	OHV87	U087U89LH4	-1404247616	8	2013-04-11
6	1	5	16	BZ2OL8	HA	W7Q68S5ME50M32	-933486699	K	1977-11-21
7	7	46	\N	45TPBF3XQBK6LE2Q309E6JX79NMCTBGY5PWKF503704B8WI242	0	\N	-2881	H9JK	2013-01-23
8	40	39	26	OLS2IP3F08J61588444RIM8K5VHJ	4	NG71F65O2MRF9U16IL5KBJKI	-1841533059	4	2019-05-30
9	38	11	48	E	56	WRZ5S2S	-241293207	98Q91	2014-07-13
10	47	22	40	0DU16RWCAMN4D6FTG	1CO82	NV4	-53635403	1	1982-01-18
12	4	40	49	R43SW2XA9HS2NMJT87BL9L2X	O	Z02Y3F0053O3QRF1	-497388298	1Y2T7	2019-01-25
13	43	4	25	0AOG7JMG9O833PO994F	3	HX8O040NTOPEK7M80D5Q57J3Z9B35WE1I4Z7	-485218831	BK4C3	2004-10-31
14	41	1	29	L558ED6YAGKWBM65	N1WP	4I5EQPQ981D5J219P87XNG3D0J320	-1453786673	7	1970-01-29
15	15	29	6	APK58P6	NGE	6903679XVBIYQ862C5	\N	C0	2017-07-25
16	36	50	42	21T9C208783H86C5586FDS8DK69E356M	09N	0XQ19OH8LRG95	2816	9	1984-05-17
17	27	17	31	C9XJVKA89HPXB857GNJVC558RJ3N1GWPHMN	96K40	5KGGN8GJJ5J0M6265NHK	-1021879690	FX8	1970-01-02
18	34	36	22	ZXVF6WO55G16	1M	63VLU7RZOM36W79YK9H7D	-1891388557	796	1999-09-27
19	16	50	31	64HK352E55P6BJOOCXC	576	BYQEO2KV95MG7M6VSCEBHY323JKP37H7M251	\N	049	1971-12-16
20	26	3	32	37DP7A9GMLM2	QPO1Z	H7898F34D2QO5S4ZO	13	8	1986-04-07
21	9	5	9	3KR45P596Y9BK65W0HM2CYM3SS7N8O6Z9V83KDI552NNX918QB	03	7BP5SPDZD1O523I3OUFO3W2CK46RT112	-412797914	4H9	1970-01-02
22	8	6	10	60C388W6QP37VVK9G3JV6A28X62	9	G4	-807144756	KP1JW	1985-02-06
23	36	\N	3	XT52F49PSE60K22KF6T	5	9911J7W0	-594	FQ5	1984-11-06
24	42	41	36	AN56V2T9U0RW9Q868143F	S42X	OJ625K81	14	6G2AP	2017-11-22
25	46	2	44	S56P49EQBNZ91C87OP9KB3Y8148SZHA53EUJ284XS8SZ03TH0X	Y8	69GV7BU5RJ7NVKP55V939SI	\N	S	2014-03-20
26	21	31	49	O	N9I	X41005826994AXM89Q6UJ	\N	ZTGSM	1970-01-07
27	36	31	\N	GEXAM6F696N6D03O528QKD09132S680	A72F	\N	-450828051	9AF2	2000-03-08
28	29	2	13	KYT1B955JM74548N8QNZ3HNY	94X	78XG955648981IDU204	-297087653	T	2016-12-05
29	9	29	40	LD449BF4U1LC7X38O3Y6DY	69U	34	-2111475580	R	2001-07-04
30	10	25	19	LOO4591	O3C	9CHS5J7804QVKIX534I254FZ	-29863588	M	2010-09-15
31	8	45	37	D0Y7QM265F0C508E6351C8	L4	64UFPRMV59Z82BC1A8	6	8	2009-12-04
32	17	49	2	223TFF8UE42Z	ZJC3X	H7DGQM61XNY6463IXPEYBO88F0	-1267583785	KJ	1983-01-25
33	15	42	\N	4TS185EOL757YMR	A	\N	-67153068	Q	1971-10-17
34	47	\N	\N	KG7GF7I79R5E25085X9GQ	4Q6K	\N	-204807927	P3	1970-02-02
35	23	42	12	3C8469AMOS14F5	L4	4MQ6C8W7NP472H6W523S99Z4CE9L8X	-420964464	U	1971-08-21
36	18	7	\N	3BM000	HMX78	\N	\N	03	1986-05-06
37	50	4	35	Z41ET97YQ0A84	MW	7FK	-405750430	1	1991-11-02
38	12	25	23	472A2DG37H49J2J0KF5E	25	1HPYZQ039Y290	-1917479195	60D	1970-01-10
39	11	44	1	I1O6J1V696	0	K	-1160075489	MY	2009-06-03
40	7	22	36	AE019P157K	X4	2C7U69M	3256	FTH	1976-08-27
41	46	43	28	QB49	UL9	\N	-5	P5C20	1975-11-16
42	48	49	40	975	V1BDT	5ZP1I	-282054103	8	1971-10-12
43	20	6	31	U1O45689AJ0	LISOI	14EC2013I	-7975	5	1991-01-13
44	4	9	1	M8Y3K8G0X4RKMYS296NZ81JJ3QC5X98S57CVGCT5ZI	E976	B87OQC2XMVCL387E1IZ8Y68V4B223L3139913	97	F9	1973-06-18
45	43	8	14	M3S2	25614	57ONZD9VM8203114	-289982587	H	1984-08-15
46	25	39	11	60122M11ZRZU8GH1CW258DL3EFG7A069	4	7F5R	-1947758362	C6	1990-06-02
47	20	5	33	GIF6U7GFC696R8F45	N	FAB19U401ZKSR2	\N	GL22X	1998-10-25
48	41	30	22	D7I	18	G4EK57E18294H0958	-639484130	E7412	1971-11-17
49	6	\N	49	3AQI9UV833AE1R13ZCZ	9H147	R26VX4P0C9RG234PU38XHN6S1967X	\N	58VU7	1996-08-08
50	36	\N	17	PK4Z89EI106AL3DP8V0Y4K19927FHRJ2H2189Z8255L6E	0T6AT	52N3KERF33A20F5JO7KN35XKWB6PLSXK080VS07381U	-64	SR799	2017-10-23
\.


--
-- Data for Name: bsc_perspectiva; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_perspectiva (id, nombre, alias, descripcion, orden, fecha_registro) FROM stdin;
1	33AJ811JSENBI7366FY6IM4	O9	\N	-1713496344	1985-02-22
2	GUVYOLK7O8340V5D	24J4O	N7	-709823875	1986-03-26
3	RFD4PO154Q724QT283L7834PXJ00Z4DR5E1O04Q8X8WL08C8W	D	LFLB5TSQ5EG14X2H259LO	-1038602279	1993-06-23
4	4V013V4VHT531X335784EB4Q90PDAI7C008XX08R3E1FPRV1C2	LAO	9RT908W4PBBUTZC	5867	1970-02-28
5	1OY561854MS93NSV7H41742Q8O625056FS1M9YA89330GYU7NE	24S	M98D37	-818322974	1999-10-09
6	674AHQJ9R5XBI20C948J94G30K6162A3V8GE37QK30PX0556IR	BI	\N	-747429489	1979-09-01
7	836P7QBSR83357URR3I2898S0IYJAOQ	L3P9	DKFQM2M3RZX32768PQ89WF0	-1944323926	2005-12-11
8	00	EUTV	GI4536WMZG73O3C5H7C	-1826834983	1973-02-17
9	MS57Q02C5W5Y4HDIUKS16BL6ID6	O6NG	48Y	\N	1992-08-24
10	NN41ZK32R9CGFNLLBJ4NSIH2VKP842244P6WFBPBH08E627106	71	H15AO630318X6694	-564501254	1978-02-13
11	8DJ7DZH1KIA35YA874RRMGE3DG2N6T77HA3N25C41OSQTSLUID	8Y	638	-200902088	2006-07-04
12	A7	6	98W28LI079507Q5KFR08DX0HE53957G537G	-92314903	1974-03-27
13	R741520B478	4	878EIB9U69LZZ8	-899933601	2017-12-05
14	S3020285659H14	21X65	\N	-86946244	1970-02-10
15	23P0O59UD741IC4L1	JY	1A4UOHL7	4033	1970-01-08
16	H81W46A1G2O8ODZHNS6A7X84HL70032H6F1O958N	J	\N	70	1972-02-21
17	OPY7SV1N36	U0	5	-1874612105	1974-04-11
18	2	1H	9E67F1R8J	-156	1970-01-01
19	32MLE1W34NUCBQT9N1TO	R	355Y5	4	1971-09-11
20	05Y7J17451P4T8E	Y78P6	Z2AY	-974158403	1973-02-20
21	UK7UR3M72	4	7O3A60W3C12XDCZZEZ2M31M8171CE5HIN069P0P9X239TH03050K2FM00475	-555467254	2015-12-06
22	7GA21BM99	10	5YK2JOPBW7TDM9QUV	\N	1980-10-18
23	050ET0WL3IT9618152903N998N10W97UYADK66365NYOXQ75QG	H3	JHOD505JIJF5H9X8GC64U	-1266965026	2015-06-22
24	J5406KR62	4MM8	19S807V1T71356CGSKJU4P651ZVLVCD9VT1B2154C1X6XRS0695	-1779080439	1979-07-05
25	39	X156	\N	-910487283	1988-08-18
26	K	HFY5W	8941UME09P629	\N	2006-08-27
27	9H4W	QB	WO5C8	-1481201847	1979-01-09
28	R5Y3P43A26	0	G1S3OMZZJ2A64	-1949413053	2004-03-02
29	D7	K7E93	C57894Q5	\N	2013-08-07
30	PGOSRM3TT9N9Z0EB6TR7SRJ	X	4	-1464514426	1974-02-05
31	EUG4O7W8H28B13O925	0G	618AMFH5GD3J31D72109D473X29ACI	-2066091723	2014-07-13
32	61FV3NGS20508671169QLI0G90BR5V272198Y796	7AUP7	W36R0S1C1EOWVT60U5T2HN6CSAFJ8ZL6IS39R8391135PVQ52X4CAT1I73983O57L7KU4527QO78V84P50EO1ZNL2O6A3K52J598	-1775271838	2014-05-28
33	U	J29WE	323HJ7W	-1426745143	1970-01-03
34	ZRV92P7C9428W70Y44L1E790F408828K8WH1UG0T4424JP5RKO	R326K	25Q0111RP858D20E1XU7RPZ8EA6K67PM4H2F9250F1K4RHWBH930LQUFLZ99BI2XG8V2S3O19666A9PXU025	-129837811	1979-08-09
35	75V260T34413QS	L4OV5	TAH2Q	-143569654	1991-06-23
36	05W79OM69YY	M3U14	3I98LY091	\N	1970-01-08
37	9BF35VAQ3486U38924	V3	J2GX1J1NXL5VF	-883539911	2022-06-27
38	UT9G7RDQ0	1G89Y	BO0HA2SW	\N	1974-07-10
39	5E141T1B4733FC761FLA76PV1B7T4N870682J213	HO9	NIB1XH3J947J7T2K134479T7719MU8R52	2	1970-03-13
40	2O7I6656DD01EFUU6OPYPO81QN2419E4	9	1Z92AN3V05VT158Z7B0T5UHWZMJ027LD77T2Y6U7S33AU06655N	-37769284	1998-01-12
41	AN50O4DO79R0FSKEWCWWVW	D	P1JY	-1936253913	2022-09-17
42	46K4AW6BEVD43X636SU75VEVRZ4Y0IN08003UXP2UH4555OU6E	N	N90E7D46IBK13ZO1	\N	1978-12-11
43	7Z9Z435U2819TOG918S440C18642FL6Q5IV1KK15E6I6F3IL4X	S	73H0I16T25UB54TKHC9TEZ9T9PX6F	74	1970-01-03
44	391S0	3L5D4	LJQ6TROSR	\N	1970-03-05
45	AQ6	997	7MU6	\N	1972-03-01
46	287TD7M0B513VL16OJM7S425JHW6NF717533TUX10G51U6W37I	76	421D3WE97J8FN9OQA3B	-370653056	1970-04-06
47	Q9M9R4RGY	7H	925FAV1TUTQ882O2283N3N3XMDZTOJFINQ0I2625W48CX6138O	-1803009819	1977-01-18
48	4	09B	B0KJW576TR	714	2016-06-28
49	840KT2I8E696K234649N4D412352D8ARPFS10X9K1BG3123W2K	F1A4D	T38OK9O89TJJ0E40	-1244302819	2020-02-29
50	DJAM1P2E4YX2I40JW101	TG1UM	57QPNYQT5Z	-1248260434	1970-03-02
\.


--
-- Data for Name: bsc_plan_de_cuentas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_plan_de_cuentas (id, bsc_plan_de_cuentas_id_padre, nivel, codigo, nombre, presupuesto_anual_final, presupuesto_anual_original, observacion, reasignable, mostrar_en_items, fecha_registro) FROM stdin;
1	13	-2	1LA66K3477SE511N55S3X9K3JC40V34L40690Q7C83ST40DB	86C1DIREBKHR9J2O7	\N	\N	\N	f	f	1970-09-29
2	19	11	7IT69B24T90GMWJYLPZG	782GY331U2E39I3AXR9YSZ46WA6U8N337J62XC71235WRZ6309C2N20IX8HV9KL9YB	-2130230666	\N	\N	t	f	1970-01-02
3	11	-1815528764	HA4K6	67	-445988800	\N	\N	f	t	1972-03-28
4	17	-321	RV2KQ98J32BK7619AFOV026P8VL1N0NJ1V0KE3NV37C390Z2Q7Z1X20040FBB3KK0XEQ305Q5	A2Z20626I6YCNHJ61T	-806069431	-1160672423	O215M85	t	f	1970-11-18
5	36	7391	L9JR576J5RO6DJWENIV26Q7Z	39N1R5PS96IFV18	-2066546044	\N	\N	t	f	1970-03-15
6	23	-1639697925	1RJW01D4	TG488191869G6A6R6497YQB7YKXN2PHAI77665O9003	-1349670514	-3	WZ6CAT	t	t	2009-12-16
7	39	-919240077	2Q	3HK0KU3059J9JD460K5N0Y0RXF	-363863367	651	NPD5AFT3IM2U8S	t	t	2003-09-11
8	44	-611875310	34C6HKZO3NR491TMH7UOUXP7782QFOQA5AR5N36IRH3ES3R2	X0WD8849MGGP8YKGL0S	-1621549777	-839501064	EY	\N	f	1984-06-24
9	41	-2028328735	78X9VCS64X0	66C6V9P	-819458344	\N	\N	t	t	1970-05-17
10	6	-600046589	NEU3V5O2BS58566	8UCRG1YD35U110EDV1	2	\N	\N	t	f	1972-11-09
11	32	-1997574768	9QEON368K785RS5PDLP78716560GJZA1CXQZGLB0U9Q6HJB7666LCS0O34BLX323I1V136LN7	CFK10V26U552435IQ0K9OHI19E7HQH68WT7L4PJC01C4CEOUHM6O8754D02	-1243801934	-1122010228	8C2	t	t	2020-06-03
12	21	-822389560	9HY6G	IHMAOIXW2H3W5M644R8OI48765GTU0	-442206065	-5082	RQ2E73G65XV3YGRT	t	t	1998-05-27
13	16	-1925940026	T046T3N2VU8D8V5BDIK5870ZDDE9Y29418GCSGX70MO1	J12BRUO3D0W5889218OAF6W67EE1YWAM62GP24J6329J9P54925BQ04A629RF18R1470Z25	-444996268	887	734TMT83G	t	t	1979-06-28
14	49	-921181510	3O	HP853QA5401W16JU2E86503P6308472D51P4F	\N	-44212184	8XY3I20926GWJ3A0TB3	t	f	2020-08-02
15	4	9	3C41ZC37A	M3J2Z	-530212171	322	65R29WM94969695H114	f	t	1970-01-10
16	9	-75	2IWJ9083IBU5KGMUY26153125TY8I21MT7TB7MH1	I5L59LCDC0L052402M5ZY4DA432FWJ971G91	-620521243	\N	\N	\N	f	1972-01-28
17	49	-43	6PK951FJ	D9718N2KUGHA97LY5ZKW0Z	-1250959664	-2120998551	0J1VFXPMBJ	f	t	1971-03-15
18	20	3	R4UI9OEDKS0SI82L9TQ12BF077NXT4	062Z304G9Z10SU94M	-1876611649	-662	Q285JO5NPEAQEK9S42	f	t	1970-01-04
19	37	-1445627802	49AHN2C4I92077I0HW11YA36PF3PITRQ42B08RLN	VNR1W9513RXA924B2VILV24Z6	-1934370908	-252078893	X736371Y97UBL57IEE05	f	t	2006-10-01
20	27	-748099677	A2	D56	-1794509123	511	LLP56O19K7UQKEL22K4S	t	t	1984-12-06
21	10	-362	F4XFE588391454	CFZX8107X22NNFEGV8B36HGLRZT1C4EP63V9CU399B7ZJ675IZ253F03N5HB780F011F	-1434732385	3597	6VRM3PS5	t	t	1979-12-02
22	29	-2120023699	YDW7ETYV4H	259RS0018BY264Y57710EPFQ4JPOX2P0680O5C9DY53OS65A49NNG875L57FR6022J992867FPVI3C7DU5J18UHCB554UI86NYD3	\N	99	0NJA0W786EV	t	f	2022-07-03
23	22	-1657487011	U949JK793FVGN2I8LCJ72IF270B980FVK9Q7VB3E64YX17W37MR6XII15G8NU	RA6H52W2OO09C8B7862UM9WXICI6S	-366663117	-647674133	7J	f	t	1981-07-25
24	41	-1260984109	64G9E5K557ZB7Q	37HSZS9W7Y740051XP6J5J1PQ5950502	-1100194025	-1009849353	CNRXC96J87S8X30YCNU5K82MFI10P3FJVO5D0SJW3O79XWKFT36	t	t	1971-11-07
25	20	-2582	84MMNO2X29L4UI	SK08N0L40QOFBG0KK027V6	-528160511	\N	\N	f	t	1977-01-26
26	7	-994	3573L8HK2L2BGF9US0JZ04L27CO26QAB	I273S920U	-721173700	-680960355	LYF091CFHL4133474C4	f	f	1972-09-21
27	38	-474	Y67AR8M4R64IX25	BH5E26ILGS7RBL4UH503HMWKOKK94L4PI2YH60	-99	-1	S5C8E8K1Y23IA5IW5NF	t	t	1982-12-31
28	42	-961371436	JT8QA337U292638EV4F3G85VBM947GYL27FS832R95	QT7L8PRHYE2ZF	\N	-1980948466	07O4727F2D1Z9H2PX18A7YX0EVT07JR1	t	f	1992-01-14
29	7	39	00HXP1763E32YLVKL	AY30P30A	963	0	9817VTF0U1YOHS2D3	f	f	1970-01-04
30	21	-1241709978	651UBTS6MV75P260DY53S1VE6FOY8GT7N62WA	KE0ULJ3	\N	6231	547A149SN7I5757A2U0MSF1107PZ03Q568OY09O56	t	t	1983-12-05
31	47	-39	PD575U3W5	987270S158F1HY0I87BVBIPY873645DF6733KTD	\N	-155851392	0M8204	f	t	1971-01-31
32	44	-81311842	SZD7EVI6A526G0	Y0VTU54AU	-2059989242	-561579428	27L8	t	t	2006-05-17
33	31	-37	K09HUFC7AYF4BEE	O1K00MSMB7M053V	5778	-1432663744	281ZJ41A0F06P10CK0DI1D09	t	t	1971-01-07
34	26	9757	I2QXDC38Y7	UE	-122	\N	\N	t	t	1970-04-08
35	26	-138997495	0ULBILPC08AR02ONJYMH829JHZ86O87YN8Y0WD8K583D7P37V	1909JCNI6Z5GH39Z4RN30ONRJIHC8B	-1423571559	-238571034	XUV8HX	t	f	1976-02-05
36	28	-1555888556	FCU2	572DX9951HX4CO53J2	-3867	10	3UOQY84T1M76S0XJCM3V9XJ82J02PMG6R9KAT7512	t	f	2013-06-05
37	3	-411787092	86Z7XUG32R1963RCTO8	61QEVVQTJ78MXMN793XP3IEQ872445R5	-580507718	-1704526321	LE28D68BPP9GLF5BB77O579W4K94K8V	t	t	2012-08-02
38	17	-758	AQ6E8067	0CVE3H072	-1994564637	\N	\N	f	f	1990-10-07
39	34	-235	XO04JI38I00D	O52272ES5185366YC19FQ895HQQ8XQ2NS1VF72	\N	-613969812	F51R4VM316B4UU	\N	t	1976-06-10
40	32	-4484	35K8K6CS30EJ21	W8B228E4IX7LK201LH07EKML9Z5B4	-1390692343	-780685412	5LX04ZSDY73IA3	t	t	1982-04-12
41	26	5249	7MRSDYQC7MZ913477M142723	08Q19JP9X	-774765371	-2064764006	22	f	f	1970-02-22
42	46	-1100879107	KNA6D3K16N0PF47V7	Y40V7G0G0P57O529TXV59LHTZ1ICX9B973W1XG83T4Y	41	\N	\N	f	f	2020-04-07
43	10	-366823580	6UK98SWP9720	M	-1987147774	-864141433	LDV2QU5OD	\N	f	1987-06-23
44	9	5	836V1615L72X44P8W4Q8M7R43PC	X0	9966	-28	58O1QW8ABAYZTO94	f	f	1970-01-06
45	13	-1603137736	D3966CQH2284LI4D5OCY	MPNEU18S973AQ7R002728327NEYCN6AH238Y6P1S9K2UA8629QOCCY0CMYW8NZ22X4700YJL37TO5CA0793JQQ	-1280156939	-1269386710	22D8AZ72Z39O1LZ	f	t	2001-05-19
46	22	-2015793595	9G4O88LF3C8P144C79UOC4S1VA49SAE78W2	V0JQ	-1697733413	-1567712441	TSOQ32K62QMFN	t	f	1990-04-05
47	22	35	65TE19VVQ761RR80EA77Y6E5CO3Z0	96M22S	894	-1787245963	A358W61DC2MS55GR3J9SSEX4R22538G82C24AY54CN5A25ISK038962I9SVX	f	f	1970-01-04
48	46	0	7S64LI	NN69G	-11	-1897312027	Q250	\N	f	1970-01-01
49	15	-1476674244	Y663Z7S9JZBU	XCML0K7S2M7H	\N	\N	\N	f	t	2003-01-16
50	27	-1189887517	GYZU92N52SL	6YF6LVS8Q9	-1378035575	-288740795	L80C0PJ8JK653Y4ZZO90D1X28351B6G5JUM2E6PUQ	t	t	1974-03-07
\.


--
-- Data for Name: bsc_proceso; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_proceso (id, bsc_proceso_id_padre, nivel, nombre, alias, descripcion, orden, fecha_registro) FROM stdin;
1	38	-191114180	6U5J56828J1N	\N	UC4GR662312XE4H5MBDU923644WLL3QE563EEQ7QBBT7	\N	2011-04-17
2	18	-1387813086	6BY3	177I	1Q1PD6V64FZ1L49Q	-1369039584	2007-08-20
3	15	-64	J5H50RN4MWVS4D21J	G770L	56430Q66D0ZL	-1858725229	1971-10-04
4	10	324	5L711W42T0612O3U089ZNJ2F	\N	0288W40G	\N	1970-02-02
5	44	-199	859J	LI	4239	-631669795	1975-06-17
6	50	-688658018	P5KCH088	Q	1BE70QO2	-70354700	2008-08-01
7	14	-1158525530	WO28CN1HD9M0ZYY	FJAYU	99KDMA3643X9JDY683Y2E5KX	-906490235	1981-02-07
8	37	-625540844	R0E1	5	GEVTCAE8O	-6	1990-10-21
9	6	-704040481	83741LXMIK53F3V8CP	\N	60M1AJ	\N	2005-02-07
10	6	-1995454571	59ROLSGPEV434589L6A186DVW30OXQ7PAQUYJ03MM18	736I1	RR898UGO6B6X1P5JIXTG9X7	265	2022-04-28
11	8	-388275829	1GMM7L9S57	00UHZ	Q6B57CS89P8460NS894OHFLF	-236	1991-08-17
12	18	-9	B3S78KL35M2Q75GN0QWNLAZ3K4V	8M	RE621	-2100673412	1972-08-05
13	9	-1780897537	92KOYX4D0HWEQX119ZK2I326YVEO0	42B3	08D0CB6	8	1978-05-27
14	34	4	RN1Z34R5UJHFQ6J96	\N	6WFVQ70FLR7K6	\N	1970-01-05
15	33	-3	HJ8A1W9N03	\N	9KR71J7Z	\N	1971-01-25
16	35	65	Q7O4Y8S13J1P95E7XQ44HQUS110	0	872Q449MWE65ACNC5TKNV0ND341	-1600963829	1970-01-07
17	20	-288304728	W5XA94D2X6M39BCT53BT360A3OPJF7ARBATB7BFK7E2QU900AI	P47L	CN0EYAR3SB4X3TBIYHP7FH9N1	-342718940	1981-01-21
18	40	-2105849145	815V289WNX6XY7Q9J3E91PV2LU0U780QV12P0E37593LL4IB09	1	B2L7511CO97Q15W07487C1P5WX8ZUS5FEAP16UHAU6N07Q00ZD5	-370	2015-09-26
19	46	-57	52FO	48AHH	TD3SR76O1FJ8YHE657N6807334B3	-307803211	1971-07-31
20	33	-98	1	SV7	76157O1K9OLMB83656S8NCS7CIA	-503	1972-09-07
21	29	-82	6X4FRLJX3V9886C371SVSD66F3V7U	\N	JW8L56E	\N	1972-04-08
22	12	-231330611	A46391M65H	9V8	45	-98	2008-10-08
23	14	-205582256	SBZG3CF7BB6M59ME	HZ	WL7JEAUR8B0H853PDJVQ0C48E7P6XP65K8E4B6MN377BI5	9	2007-05-01
24	34	-1777349881	C31K5A2BRC4F3ITJHLGZ486S1SS1220L627	\N	11GJ55LB9XY	\N	1997-12-25
25	35	-6021	5AT725OJLDA61FQ23	ZN	5VQN80DC9LWFE29F7X4OJYQ82S8V	-838936661	1986-06-27
26	45	-1214555261	914TN307FK	75SHE	Z2Q576275Y958B	-693669439	2002-09-26
27	25	-494442728	PVYB6AEQPSWRI	P9	KG2A093JGB9CI22RZL3771784D34BH9J1ZSM58D5366K2AHY8822V0S0	782	2013-05-30
28	50	-1591115897	PGR110MIYP0532A9S3NGRZVTQNH6SP0875EQ18NLFBHD6KKX86	JD	973MY90IH574N	-1609177608	1989-08-24
29	10	-912894240	V4IF	2V7	98N0	-1139232877	1973-07-06
30	6	-23054444	X7T09T	6QI	13IBW0F8FVTYRP32	-652	2005-03-11
31	30	768	IU0BHA0A04XN2ER2NU2Q3TO87340	5O2	63ZO2A1	-1086169313	1970-03-18
32	33	-791390053	JL6G3XO4SIFX413RSIUC3RJW855NA6E4UF92DA1956	93	AHZT	506	2022-11-30
33	30	-609117027	7RCPMV	85	PX874ZIZ6H	-822091629	1973-09-28
34	36	-301661022	W129	B	\N	-1208448099	1989-04-13
35	12	-919	THC071KOI1E4Q3XCZ152HIO	MW	160XC5T52UZJ0K5IHEUL711C0I70T7Z34W50295IP08IMAW	-1101081363	1995-03-06
36	16	-1684051935	4B1MS8	9H	L08SDDX71	-4766	1975-02-12
37	47	-1186263602	4GVE2S4NGG072	3	PQEM3XK431	896	1985-01-18
38	34	-812867741	9E407AOKHJYQ2713FVNW5457CM1YVFTA0FR97KLUV2	89	K5L3	3361	2021-03-02
39	13	-18421841	76CQ2UBEU7	E	1ZHXWZVPQJK2K83	-1736618632	1997-06-28
40	36	-320001769	22EAC2ZGBW85W	7	8IS0L8O68ALR5MZ5M2H5SHJ6OH7	-1542348721	1987-12-01
41	19	-431965286	62709Q46571TU5HP9ZPH2F7B8	V5FD	00R1W	-677	2001-04-06
42	3	-1537140522	7IS1	1	C9PY5C7GU4	-1578506108	1985-06-20
43	28	-1762879272	1A521Y4ZGKI8MAIF6G5B	\N	45V9994870242W7XR1CEZRVSXEJ55V2DJ0A7M8QC1K21951ALRW596496XHR46P	\N	1971-01-15
44	37	-1187993076	2C322O	LNJ	3	-1283399162	1999-11-17
45	28	-1083785485	KZ55HD1GY9WY5	30R62	KX7X8J90C6AK6E2	-1030641274	1980-12-12
46	39	-4628	V0646C3E0Q	\N	\N	\N	1982-09-03
47	29	-628764967	MWK06P778NOPS2W7PL20352EWWE8UV3NX5EV9E0V39D696OVE1	JW1O	G9YA3NZQ	-1487179654	2008-10-20
48	36	-704606145	D9607WAW0USY09428OV	X	7Y01A7IR1BHPLDM	-7446	2013-08-28
49	36	-1391455858	806GYU0K6387C4YK5Z	9IS13	19728354HV1DP	-2090108377	1974-11-10
50	10	-453355038	3I4T815A3	29	9NS5SP7HP81E9XP	-765	2014-05-18
\.


--
-- Data for Name: bsc_proveedor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_proveedor (id, organizacion, contacto, cargo, email, telefono_trabajo, telefono_movil, telefono_personal, direccion, ciudad, estado_provincia, pais_region, codigo_postal, pagina_web, observaciones, fecha_registro) FROM stdin;
1	WB9XI09349SDW9VH1D9Z8I5577RKORUXX4SXI7OA6868TQB274	Woodrow Lassiter	\N	WoodrowLassiter87@example.com	6	\N	9	8F31236524808T18328	\N	C03P0182WY95J5827BT799O71JD1L	WV-BI	403	3W89V0A2V	\N	2012-09-26
2	JZF7I4T1986TP0WNT8W939H6QJZ9R6G758Y0C1IGTG1OL5OB13	Carma Abbott	\N	AliaMoeller@example.com	22X	U3	HG	5P009I40D623H6J7U7	L88584PU918W	66DE3KO0I0K4OHT003433UT783R5HIC408Z14I10A1K7LK3	FL-BG	2O	2KEKO5425C5D368T8LDB1QLWS5	MC25XV5B9H81OCTHMIA50	1970-05-11
3	VKA1I2ZSS	Tonya Spinks	3TIA78C6232A2Y2	Hank_Mcmullen@nowhere.com	2	5XR5WR454	8D	41UCRJF0THOHMY7N4S6R86H5P138G5S3E5	J9UJ5SW7660P6	V61SC2	TX-WX	39	\N	\N	1997-12-03
4	203RWB55ZLSJ3309H0C6ZZV1149	\N	\N	\N	1	AT	\N	Y97	3087P81IH2	C602638X60Z1	\N	9I	08D0X5273AII1BDG6AV67DG890372OX56331S2241X996VH29A88MK5T4P63O87QXS455XU6N0J0O9BK4	J1YJ37L6L9RG30	2016-09-20
5	10W5	Arlen Burch	SNPLJHNWG6Y1OXBIK95JFMWO	KiethWester@nowhere.com	\N	\N	6	3CVILY87KP8K6025H9CBNT8VS4C0ZT9VPFR4	43E78OV76P2M8R6H709U5YB7X5Z7194E622VX3859ZS77LB29054T73HJB1T662967962FOY1QSZ5S2U4MIFFI6U2YI	G9FC3CNUXXXJMR0293994M7E3MCM1906W1Q	NY-LI	\N	G6	08U9423RD9C6T36D6X8BV48V1K0J9	1980-06-18
6	6WKB9	\N	176	\N	7R18	ZF	U	US241A	93J7WG1OZ7M8QL053Q23H3J674D	30QV6281243	\N	6	SQQ73Y7MGK951A78DCR2DE1K8W7N0L8TH0T8QU7J1K607B64EA	\N	1991-10-25
7	56TKLSN9B5749VU0JEK4BO1O28AZJ10Y89NHK41C641KJVK75E	Daisy Roth	U829X1O3DJ16G7819DS396SA54Q6ICW9D0R67V09M9S12B18HO	AldermanG@example.com	XOA	1D6MA11	U	3I973JIA	8ZW918FZCJ5L8HXZ46D259695Q	9WY62087Y891XMN6S98N1Z838GG02J8U694GC9V4T4	IA-ZV	M43CG876V6	U7	21T81C8JC2609259L9NG8V8U2281IDQO9DNN	1970-07-23
8	ZM5BV40E7U1556	\N	EN	\N	\N	GJ76V00G97M4ZK	03	594A67AI263P1D47D	S1P57S8A9OD1G3V7	WZ4ABWR7681G913E3J679AON12N50XU	\N	V8	Q91SH56A	YUK95DDE3QY588V	2004-12-22
9	Y2F3Q5024242Z0YC0WHR148IES6IA31LV2EQWJ947LDH7282HZ	\N	844	\N	BX	4RYOPXI	V	H9U9Y1M9KF35I3G5071N01G6899XV	L45D431193D3YKV0MF5I8GV0	HD1O2JSA7	\N	NRA7	717255YHSPH8N24025LA804X4IDQ21XE6YT	9PB509358X	1971-04-21
10	46RW529WHF7TD70F904N47048NSRZ55	Berta Hoffmann	F7AUYR1R451P08FS0SA59016V72Q4X9	WarrenSherman@example.com	N70ON06	B6	XQ7J	85BXRWD1007N628S2N3LF3V83113Y21ZOZL2FLLSSEJ629826CQ0I0DC5O12794IP24E2VI5VP9	5Y894OZ2649505A943L3MGFH13FWP3JD502L59	TRC4024AP68V6385DPEJ49471JYI51G165S259FKHO2495OTHW21VCTI4O83U55D44AH5G0ZJP5N0ZK6600RJEBWP8A3O1GZ766D	NV-KG	T3PYJDG	ST7CAGJZNHND1ZD20TH902767	D6184526W15N96G129CC857E483ROB9C2V1JT5S1794	1970-03-11
11	M1F43U31411Y	Freeman Nugent	42	JeraldGiron427@example.com	J	T	380809	9	F	9D5X957YJVD53T6M8IO1GBC7P8Y1S5ACCFIW	AR-JB	\N	J4	828YYV3V8G541ZM9GXO5R3M5DHU42X8H1G223	1972-03-30
12	425PCHMI4MM5TT2YM82ELELU59SB21	Theo Alonzo	37LJ1J4EP816XQ0ND8XUJ80SKHBHOY6K011Z5B5D35AGQF2Y94	xoebrubg_pqirkdkann@example.com	66N	4	3L	K2UOCKP2JB4F94KXX4O2C0T5BZOAT8Q2BJ35P63480W1NS87UVKNYV58DJTJB2IU4M301E8V542D	PGPC9U8NH96USU67TV93IG27E9WA5	BA380B17Y72FRCOT9U74WNK156R5KUB24Z73RW88110NA47W9F52NPQBKH2SQU145Y821XOF890R1	VT-QP	8XEJI	9471DI	M946099C936F1Y74O9A5VX	2007-06-22
13	33I705G0K15HV6W26G2O0BFVJ8V465ULCF66J8O420	Gayle Acosta	0F8PSO81436B9F47379I06B09B79	Aleman852@example.com	8I	0I	DL1	9M3VBALBZEJFIMEDTK3NO86KKDYVZ5F275F29L8352MD3I3T0X6R4Y6RY9A	KLZ2446	GH73599W1FI2MD24	NE-DW	\N	N6729M0P7	407	1990-06-19
14	8BH3XU6B3802G503223H52RA0FPRIL02077ZARIQH2SZVPOWJB	\N	\N	\N	V96	Z3D	F5E6T	RO1FZ3602W6E3KCI2W117	25M6N5P3AS76N198N130BQ25SBN0	UA8IKU4YHA9CJS6UK0MM0LHW1	\N	93	OZPHVZ888NHT8O59XD	B066V	1990-11-13
15	V2VX7V21D9979	Karrie Regan	0331229KX7906TNI97J1GPT3YO19P6360	sbdxmszc7763@nowhere.com	PYYVV1R4W	S30O	ZWY3	41RNMOGOTOY67LT7S	829C3799Z1SU6K25R26VSK	M1	ID-PV	FRKO4DX5	GJ2TW	2	1970-03-15
16	E9KI1HUS9842T42CXNRFHPVS02F9N0HL0XVC9XN27X84T35HA6	Lindsey Buford	N1BP8V6028204799552	TomasaEastman@example.com	J	YE	2TT	\N	ALSB481CKT9Z6D8648TYY6SUIBM04R57	N905F5R782F30W	OK-EE	39	5E6INVJ	\N	1984-03-04
17	80	Celsa Abel	55EWM	Arlena_Abel@example.com	R	7	W	2A0ZZ910W	0TPN3Y5GF44P26EJJNJJ0505UYUBP	EBP69HDSD	WY-RQ	\N	NK2H89UI67P3J	8SI3X	1970-03-26
18	A4909N00WW3Y7JMU0L3ZUDJ	Boyd Hoyle	NSO0881AT218CZ292G24981O63ET0	Abbott@example.com	L	Y6N	I	5T5U7926T9R	2K0K	G7E786Y	AZ-KQ	Z	VKP9YIZSOWPT37505587B51X883TRHB7091892IVSBE	7792054C9917Y31LTRQ3K9X23FE9VP8CS526516G904JB1H5RK7Y59	1992-08-22
19	B17X773R07885UF5NA38Y1222U	Abram Abernathy	4D9	KlineP@example.com	9W95	0	78	HR9044M084ER30B15524N5	6Y50V6SY1P736IP6910HF215D6UAPCTB5RUA58B9JA7H41RW6Y5U1J7YZIC5W2	\N	MO-GG	162	QFN3Z0WNAGK69Z1224129G8U3E3581KQ8FEST2N9O3NR6	3RWT68KZL0U2XU	2021-07-31
20	38WM9E704	Nicol Gaffney	\N	Caballero@example.com	1E7Q9M	04Z	QX	148Q0Y653Q1YI1GT0FH7K283WSV	CTZ8EZWK3324216GLIQP4270U8BJ53GKPPT3F4ZC59B960	S122Q2D145R20523B80B2	AL-XJ	T	E0C706JR2U4D46XZ1OWO03R8H24BJ8TBYJ6WG	SY82DZZ6SP3L9XUKEP1323D3WM55OY	1981-12-24
21	7RMX41B54CMJ9	Adolfo Lacroix	IZ530PM4L4QA3CH812QT25LNWUEG1666D4VB	boceqtdz2754@example.com	TI	6C8	EOC	L61RY39H43372I3U7P1GO1P19G1934Z9R4ZAZ71FS302K7K426V7O	25G370NM28SUU3Q31Z8YF7X0023T9P1S49S044G1YZ0S53AUK4323B8S68LVS5X	73KBP66L03UCW	KY-EC	\N	04N1GXZ204785Q6IJJURPK2EY0M60SDX7PYJ	0U1238O511O	2013-04-28
22	1282CBHD7BZYGL24C95V1EQ3Z4473O34D88K	\N	7	\N	W8Z7ZV16Q	1F22	R	RUS0NE357S9995BDHH16D459	GN8Q399XH407	\N	\N	D	I8NN2A4THRS7MGD8W00K84ZMHE	\N	2016-12-17
23	QK50223E73Y7Q69FR4U6OQ3KG	Denny Rosen	KQ9408YJ	Acker999@example.com	7	0P524MU0XRS7	FA1	\N	L7L17B16K4Y10V8	82X9ZVTM23AKEIRBZ6W57V453P788ZZC7KJ81T765O10P845V642DA15I4722WZXJX51BRP62IY0JB86N1S5K652USN3GL38W960	IL-JN	\N	13TK0T580HZSYMV2T73476794S6690M9YO47A460ZD4	4RGM83J20H71K7171O1ES1I4P72C6JCX6S3DBI5IJ1WR706	1974-10-13
24	55O6DYE4FPKR646U18289K5L48AIIQ62SQ1Z	Marci Schaefer	TER3BYM3O9	AmmieBustos6@example.com	09	576M1S3H6EAAJ4K93K2N8W	3	P4CG9Z09J046928	LQ6G74E6EW0NO943M0P9K6P236NH6E3M592IT6T57LPVODQ3MZ6348S8O41M77ERS684EA2XLJJ0L5TJQJT0E0ZWG	RQA17O93ATA17QE605F941958LG2TP4NY89E547I3	AR-WZ	N	OK2A0H3754QRRE494E40X4	0VNZ4M34M1QUMX0THDU556	1973-07-24
25	V4RB358	Terrance Maxey	1557	Mora355@example.com	KY	2J6UIC08MJ626ZIRRK	\N	2OF5W64TIXV2BDT855PTE7J06BZUS447H23VRMAH1JLL9L44H	3S9MLY50210	V532QP062Q3SRGC9UJI7H06TFIEUD7HZ985B7858KKDG0KXIQVG3P	NY-YG	0W	M2J5	U4T7OD345TAB44SUMHLNUS11T6GT4OO7G	2020-06-01
26	740VA8J79ZV8CCA0X49O99	Terrance Abel	5UZ4FPNYG08T6EG265LZY2XK9F9YJ6J2390VVY88L18W2	Ackerman552@example.com	29E611H4870	RF	HT2	PMIIH1SR	42044TM545GA30G70UPKA4ZMM265E432K9G3607315Z01X55QH31MMCGI5FD8O5E8W472HMP14X1K923S	TM216U9AK3F1ZE8KP5T1K58049NH	OH-ZK	6	AL63K9J3XU6LO5N1645HV98FRTXJ	PSBT7Z7639UE2617VS2XPRH9MO3OHP03B6OPQ3	1994-03-12
27	QY612TVLWR9X01	Shawn Valentin	H3E0ES67K5PF99SA	uaziiqwy7@example.com	D4	\N	X	U	WM9VOAZ6P6MC5619C6U9Q2700VLU7U39D1TZ3SJ883HS700WMT09992708QB23806GB045K7GB759XACL9LZ0JAA03	501PVTBHSG9H	NE-NB	\N	012G32285VDD	L19PK4GB4MF7W89N6R1T84Y88N09LZ1MLP10G3PPO59SK9AU834O6	1994-03-13
28	JV0UWX9RE8E4I8CV2ICM2QC855AI09X4TN7V9MK3A09	Hollis Bickford	HUD4EZ0DE4L3V1T8U68JA74881ESO1286H35XDCB5SJ88O	sulnyibp1@example.com	\N	YAR9	OAFZ1YYV4X9OYL8	580CLD50158VVMU7108F1039H	303AEV3BCH	U5H87XJ5LZV43RYH78D	KS-MT	DDC	891938GI902	9AR967DY47M5A0DA6R2MKMUT9Y39H9762BN0	1970-01-31
29	9DWLXL9BSZ1WQ66G90LTFM8JHRZTDSOG0L5NF6FM6M8W727OEZ	Lourdes Everhart	377B	MaynardBoatwright@example.com	57Q5F697P	9ZQ90V	8	YURAY7F0F0201U94287	\N	\N	PA-PY	OS50CX7J4C	B648QJD464RUD5WCG0BLZW379O	2EK7V1FJ23P8Y4GTMO87HKS0QYZLE02O3S742867Y78951J537JC56URHI	2009-10-06
30	OTH20Z02GO	Detra Hutto	Z3IS4YQ1094CNNM319KL5O43D1SL	AlexKelso47@example.com	62QLW	78	\N	9I5VWHH556N8	XL179YOZBI433PC08M62U5495334604A	0P477482B6AA586C00FN3A00GH2W4S2F	AL-CR	7	\N	\N	2019-10-26
31	3Q7US4	Tony Antoine	H8	Camarillo@nowhere.com	\N	62344A43A	2	DA6RO9INX4IK1266QI120KIQ4	8L3362EHW059411N4HIE0JS451UDC87NOK0D8XR728Q8ASHPR5N29XKU4HTUY0J3	6A3370G4NZ3T16M967090M0R8	NM-SJ	\N	5PU0JF58YYN58BP8A91PAPTG515P7E6I64	807L4985KCP3	1977-05-15
32	VN2VXS205S8817117HXO903R94VHL7U5RUJTIBL0H427305Y41	Orville Allman	T00P5EQJXW6HE	Bedard@example.com	403	\N	2G3V9	ZI6RJHAH8PI3834TY51MEG37870S5I7AS0T5EDIG14	M63832O5	Q2	NE-OE	LTA48OL	3LOT17Z84AK8QRCJFQPCYG7KTD2UKH5LSTN17VNJO4CB7767AC	IN5	1972-04-14
33	2MCJ04B09130FAZ55LE3OLI93U7N0	Shelton Cowan	937FOKP266X217JK55I354P	LashandaCornwell@nowhere.com	\N	E	M0E4W217D16A	J6UKO42BA2BG56HDHSETOSF0M4LB40219T69S0V2347RH4RQG392C9NF8UNO40Q04WIR5	69QJU084600Z15HZPW1	8BDJ1YP5QQ655R89AF0JLJ2NY7Z9TVCJTN81E023T4F6J552L992448A7HI38SQQ17F2NQ6E5APZ0RT289F87268TM380E65EUEF	AK-JN	MNN	98ZXAGATJ8LE4ULU1RL2O8005	OQBNV	1970-01-22
34	SG08N0448929550	\N	P0221I7SMG0Q3R0Y53J	\N	T5	3	M00832LK6J	7CPJVS7750QL6A0Z6IJCFEF00K58TI9C0QV8F	SJ77RE9FZ	\N	\N	4J	98R807N480G33E9QWQ9CB6I74Z04MC40ITIJ317R70T898ZXEYT16JM9	BAGST	2018-01-10
35	73037JZIM2X2590	Hisako Clanton	Y8	mcib9790@nowhere.com	6	0K577220Z	U203	QCLTW37X16L7A91556	L4S807DBL593N1HK075U3K3F93G	BN2SR9S6W671DD78R54QB9X327W1SF24523H	AL-MA	G6	0SSG2	\N	2005-09-30
36	4UF9KRD085C007M9RIYBJM5X75EMKEC892R66C18249P0NKY36	Cecilia Ralston	84CCUM	byvkdhjz.mzxk@example.com	1	9Q7	6	O596	5HLL	E836GC0G2	SD-ZJ	ZH	0I329L5UNFKJU63360EMPX2JJF	NEHOBAE	2004-07-01
37	PL92911F85	Dominic Rankin	UXG51K5H4W59D8QR	Cosgrove3@example.com	90M	6M4	N54L8C	5FA18KL	30N4F3Y21ZTCO3T7DVMHKB4JLY693K5PKNYG0585JK8BAB0AZ9Q046I39P320KQ3TSA5YE468T44X4	\N	TN-GR	JY2LEV0JB2	\N	DTXAQ0K688B6A62D285	2022-08-29
38	26V73J0VZ0999C10YD0979294Q3VE0U194	Porsche Salerno	C4NJERN49P5D6P067IO023M4G	Nicolle_Coombs359@example.com	2701M15	9Y	79591	J26GUY2G5HTYL50LK3629L3R	2CIJ951Y0NFS2H23WEH	4EH3XA1723	SC-BS	S	CELB27JGJ1485TM33E840VX0XJA75JGDEI67RK8RV9L45LXQ9L965K63E6G745383RD4A957M497KV2S55P1	\N	1974-05-19
39	1	Ernie Cohn	57D7S5CEUD1	Harry.SArmstead24@example.com	WVC3	\N	D	SD9EK008	\N	3L9J6SZHO928NKTMQJPU5TUA911Q8NBF	ND-YQ	9GM0YL	NH22N70507WJM0842W7A7UT46Q9X5128N132IYNE66358F865	OM09JW212RH34FPCAZ3KFR36	1974-08-31
40	T2F1953359RS970	Orlando Esparza	HVSR	EspinoB@example.com	78	25Z	K43614K	P0	I5TB84JU3D33WY65JF2	TJXPJ0TM750QJAYNULONV8N5TA2PQH251X891FDC8L93I33J3B7S7G3H9E6ROHWF6V19	NE-NI	\N	830C	YK	1994-07-06
41	4Y3Z0YRBE99BBQ68ND6ZW11Q381993	\N	BLM7N7C	\N	R	\N	K80J8Z	A6O32U9A	9Y4SYMN877RCM501FK2C7R367VJDP2Y4R477P9Z17RU	A70AJFA1984EYDD	\N	Y4L0JBH	6493A8	5X3C94B2FENM0Y8YM3JO5ZYLWC2M64	1992-03-15
42	3VZ1252T4NFE0	Wendi Abel	2OB8JB80XF403373	Shirley@example.com	HBPRHT	4	TH	0GQU5KG956WZU9Q3L9P8YXP258H4GUU5VS0	925NS6RBC9HFZ1C7TY59CHZ3DUTA2M0RZ31Z89	A035VB7841N0603OT684JMDLTKH	UT-VN	6Q	P0TLPBI5SYDZ1F9TENU852RRC13388	FRP2GVOIQ171O5G3	1970-04-10
43	J7	Adaline Boatwright	20M636BV1NZXZ	Altman177@example.com	48O394R8889YI	0449	3B	J15C	86SU26778PDA286XJ0E0569	5K8R9MRZ218KY863IU	WI-WJ	8	H732H69QMRF	795V57954W8ZRW7TDU5B4S5W40OMJ6664A	2011-08-09
44	3534O01LA6G99339O3TAE09H5PC4LWJ9XWGUG408H724F3V904	Karl Heinz	R38B4566Q	qkczvaht5474@example.com	S	O3IU	\N	C9PPPG1I83N1J4O002789O1C02Y00N16WRQNP8V3BZ068T836281YB	C6K00F7FKFFXG3SO7J8N1U2GX556Q4S5NTGBQ60C	\N	AK-AX	H64SQ9	5XMV348793270VEWP	253L04U6JAY08J35034NYW99THQ852J03402WAWCQE	1970-01-06
45	33L6DD	Abel Demarco	25UU3TM8O	Coons@nowhere.com	CBZ	K62	XP14	OF8T2XB3UXF4O5069CMRBFO86M26468B7D3W3T6DRANL4M356EL49183W5Z8LUM0C23PM0Z8EZVE8659355G7J1	NUR	3	WI-FS	93295	6G	399	1970-05-12
46	AJJ8T00RUJM1AN1436054HB3M8	Pearlie Flint	L33641ZCYI7391ZU47848K8	Wallis1@example.com	2	M1	21	1T2J7607K33UBY803E9Z4BXN17GI290	VAL1BRT8TQ8X308LDN5WK77QQP611Y437450O8IN27WBH6861RM38KF2T488P54L911C89DC8855H10F837B	B86N03S8SPKN4LCU768DYB7ID0XF862X5EI5YB9UF1JCC0LTHWKE0DY4E047DCT21286X8RJ9KGTUI32Y1VSLCQWYGIS372239T	NM-YQ	V5A34	DY6K8D04900K7QS565LYXOGOKE5	48D3055CSXP197L64XNYI4TCX3	1999-04-27
47	7AM259H624Y91K44367H9WSIXV1RD3T7PQ1	Tiffany Whited	\N	Abbott878@nowhere.com	8H642V	M79G4P6PN19	HG	V40L2CY6UQNY50E04S4V224YE79FM3	4Q3J7B3J1X2AQHPHQ980K2O	93I45X9QN8K038GUO4TRGJ906J1	SC-ES	U599SZ40Q	Z47PS36WQ3EU379GUXD299BGH14EV3B30N4O73V3O0CB13WZ1UAYM99YVGG39461PS3E21H576BFR4B4Y62981732V4M4	\N	1997-10-07
48	Z6195FW47GADVY22PJ6	Abby Mcclain	MD6U69Q318M2D6V9S4S	Camp@nowhere.com	0L	G192	9SH	4YGU1D7U3070G458474	61JNZ5V	QJB6K353EDPS4X	ME-VF	3Z	JQWRO8F817X5K1UF7R	\N	1970-01-08
49	X2GQ21PS1WU4XVV1S81984OHC155XEWMR4LC4ZTO	Lindsey Bryan	5	tsrue6@example.com	0	9M	B	\N	2AX89C8XOPK6U83FJF4QUIB75V70080	K3J	RI-HQ	7	77AZB480	0AA0RV3UW0A	1996-05-20
50	19	Kimberli Runyan	\N	Bowden@example.com	\N	5	2	O5	\N	5OMLL5G2279SV1NQG45MWM47Z8CUT9S4G32061	CA-ZY	6R0008U0T	475K1T0C6	2E5DJU4B1L43982WD80N00KGW6WQ36	1990-07-30
\.


--
-- Data for Name: bsc_proyecto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_proyecto (id, org_persona_id_responsable, org_departamento_id_responsable, bsc_tipo_proyecto_id, bsc_proceso_id, nombre, alias, descripcion, orden, codigo, incluir, objetivo_general, presupuesto, observaciones, fecha_registro) FROM stdin;
1	27	44	46	39	E9F93PEK7I	6	I95Y	-1649684307	Z2	t	BM94Z7	-680126064	1242016KVI45O413H67462	2009-01-28
2	38	35	2	41	T06	1	IPI8A0H2G1YG3846Z3R	692	1V	t	V8915HYEO14O16177	\N	E5UX7P51KBSTA5W5IXFM07583O033V	1970-03-11
3	11	36	44	45	5E3R28Z75GVGBOCV	0T9Z	VZ9PIIS43SPZ9Q930889FL8LN5432VVX0	-826109556	2	f	T8T82510	-2009044290	K	1978-01-09
4	1	4	43	4	2Z3MX134G562X0	A	PMZ1FQ8J4IC3XOCCN8EZ	-32	Y	t	U57324KW6NV9X1S2	\N	2JC5FGZ5LSC155LTSBQ25IU4WX2V7R035	1970-11-25
5	1	8	18	25	43	4TF4F	76873K6747O97M724KU0755X10OES47T24P85YKQV67AD4R18608XU31Y0360906R075S4C13802JL8816D8P0R896QD96I13Y45F2SNBQT81	-2114864665	F64M	t	60HQH5V16QWD036W280	\N	MOUGENV26Q	2008-05-20
6	45	31	29	24	BB3361B92601G5	LP7PG	743HW79LVDSHF65X3209U38206C5NIQ198BTP74O94I8N7E3AB04567IIECES2	-1852324428	\N	t	GT3W	\N	12L1C818ILEV4FZ9I48OV4V37VC82I78AA9D2UTS3014Y1H3MOP3R93Z1I06P3	1991-01-08
7	12	13	28	1	UV174V9T05M5N6774L6KLPM2K849G7X6TB	P67SD	9558K8	-437801463	2CJ9	f	6LPT2IYRAO6DXCQX9894Y8V6W3B6TU6RIRII8SO0753T32	\N	\N	1998-11-11
8	47	18	9	26	F8V44EK2Z2DOO1JKC1E3R8DD982686994CMO63ZSHJF91520W3	7E	883	-634688804	6	t	7FUR51I301	-1965288474	38VCNEKR64GHCMW	2004-11-09
9	16	3	26	45	A7X3E23P48	J	N5654E287V1PDFEDY	-546497480	39	f	VLH9BQ4P	-6417	\N	1983-11-14
10	6	36	13	23	T	8K5	M2HH453X67E	-47055455	U	t	PJ6959YILY38YV6H8	-1824326153	X8HZ56WN1408W1264ZMM16UJ461ZIQMP18665S768GQH2TE0X8WR6127V2AXM	1976-01-04
11	16	3	29	2	J2Z927496G0S	X3	93968	-991442607	78L	f	DDPI679	\N	\N	2017-04-13
12	29	12	27	18	N6C09EG	6	2OU18592QC	-19690218	1	f	UK26448HC	48	6L3Q8PU	2012-11-24
13	14	35	42	39	6P82FKUB08E9A23S9T03F8L	2SYG9	VQ5L5C9EP1I2S54J2R	-1712380116	3G	t	25DA580FM1M0W	-1453054470	4DZ8J2930JMN3637GYJ74UYL4E29C7D	1992-09-10
14	25	15	18	40	5I9	8470U	26PM361QF55N0KJDG	-1774248852	\N	f	3N2	\N	35Z675QFL5	1986-08-13
15	28	4	47	7	9A5J2L6N87IX6K2T8YN4CP857EH5Q5K8LF6945Y0XKHR5CT509	2970X	12YGY2VPDF87Z8Y9230MB8B944PM	26	BF	f	YTSF8Z9BJ99846X5H040R6BZAXAIC9YF34GH1	-1814300596	GJ4	1970-01-03
16	24	36	22	30	0C3Y24T35I	A17RD	K5X84K11L46683TF814CQ956C3X	-1790729845	4D	f	R717D7B3Q2G57GFV9	-711	MQOR2N95FN4L25110BHT9BVA0	2010-11-06
17	31	3	37	39	1X	5	422M5Y950N9311O5GMO25	-526807263	\N	f	M39Z0	-2009197736	1LUQ48CMK5AW5PL18V2S72M	2010-10-16
18	10	26	8	6	A1PZ44S9BG3VOS69CXBHM2BGNRKEP20PS334E9L1GMG4PQ3	79E7B	59	\N	L7	t	1XU1F6142U7JUA5TW0RLZ15B76111DJLP02U14791K2WCM89JABCO2G2D44AZK2X1WZC30XUQ62U	\N	4J1XSK3964S	1985-01-30
19	9	39	2	46	PI8655BJTO55O49QSN3	1V	\N	-550	2MV	t	98B	-210241311	8Y7718	1979-12-25
20	23	18	23	5	7P2CR2J68YE6D187YGA79AU356L9NKKZ3	5K1YI	36Q477V0ME624F4O95PHDYBG49	-364	352	f	11	-267915469	14M4F	1970-08-24
21	42	48	26	41	3BVM775	2J	7C748	-2	6	f	0	-1655244554	15WF1CXCHNV1NS819YOITWSC90O66N9ZD0841UR	1970-03-06
22	6	45	5	1	F1176O4045MVKO968X9650ZA6YYTMJ32U	712	15F	647	A0	f	321BTGLP6	-90218918	5Q3367795G	1987-12-15
23	40	28	29	37	JR2HGTT8R	Q	NW00NMGU	-1088410420	15	f	3F7EY469CCWX6DT55H51RT4HS7V	-274970287	N2S7FR48HAUCZN090GAM48ZMJ2V52GZ	1993-05-03
24	23	2	15	2	8W1TH458F8NBNF22R6CA7P4WN	3N1	9OAOZ0W28	-852	11MWR	f	RKU43E	-1786535732	3CFX17A8RRA	1997-02-19
25	45	5	19	12	2	O4	ZV292PV	-872266856	7OFTE	f	\N	-745697179	E5U64G17S	1979-05-13
26	19	28	4	20	U	AB	7PT323119AD04M1AY	-1115454463	3	t	NH	-73	L39AL0B70Z306946E7U1IR191MG005BK46ZY1LT2399311K162KSVA4W959QD9O16948X0X9A2	1971-02-13
27	39	40	19	34	LKA	WU6	3J54JMEK154K40465SITZ5NOX08P17EZM13055A973F69I8I150M1	-4	DS	f	RO2S8959QX2PW18UIF4OL4AD8AS72O	-120022394	596X57R152P1	1997-05-12
28	12	1	45	16	XBB17B5CROKHUG9W412VOT4CSS72U3HK9089FD9UO3EMKMAC7L	9G0Y	\N	-1282503077	T	t	Q	-2140428830	0DR71QW1YW62NC3H079	1970-02-14
29	50	3	24	21	7V5	23R04	OL4FHO9IK2C6J09ONGLE9GKE72P	\N	07H8	f	289AXJ21F93WSAI9Y4	9	EDE5IU5	2006-02-22
30	10	35	25	39	1V23724O88WP5M5J94W80E836I2KU20H3ZR57473	8	PHI6RV42O551NDX	449	W4	t	\N	-1833466112	8X6W1138M5	1990-10-17
31	32	24	8	12	KW76EZ617MDK4HV989TXHAKU99HAOIS450D16VT1BO499M95	JT	W72G737M5465AHH	-688685859	O	f	C49VNN3442B90NX9GU1664NXC6R269Y16ZYRC57PR28656QYIAFO0V6445HFWESQ0ZA9K1K2ZBQ90EE7793	-1592557939	06R3SDFV1733	2019-02-12
32	35	25	5	29	K40E128TNJ6ST	2Z3I	6773VI6VNJH9R4ZJ5	-1725937950	1	t	4ML1MAXI9E8ZL8	-847845085	\N	1997-07-30
33	19	28	23	31	T9EMK7YH80N870NM957R8T68X52T7634L5D51	R	0WUWE8750J3G7B9EAKB	-533370780	L7	f	588ZKEIB94SUOP	\N	CBE194B9GZSF607G7VG2I7IX	1985-04-04
34	46	41	45	42	265HR	F2	MAN6I8R322ABQ9A7Y43744X97759012209NHB	-1513665099	\N	t	29C3UH92U	\N	613718EK6H494H8H7HS7NZEER0J9	2003-09-16
35	22	33	45	28	M95DULQDKC	PC	701M	-174149857	9	t	78HUN5D1U39321	-2065320973	1J4U5R2Z345U	1970-06-26
36	15	36	27	21	6L1TA4O5	MQ	8	-492277913	82	t	\N	\N	3UO71	2014-05-09
37	15	27	20	16	39Q8WXMU94UCK57ZOJF9O2OUO3GO85HR8X8YM	0	WHP93CF1J61P462G6M02	-17	4QL	t	HB4A1JXB	-782	6VL4128V3YBP6O0	1982-01-15
38	12	30	14	25	WR	26VB5	J9YIU8RRP444UJ74	-1995086532	75CA1	t	WI9V9DE	-2003819931	EVDF67L	2015-05-24
39	1	43	48	13	54	ZER46	5E7E32891HA5GUPT156K4HE6U71ZBB	-1322504408	6	t	\N	\N	3SF9LWYN2OA6WY2AHK6H57TLXR9	1995-12-26
40	8	37	29	6	KU6SN9D736608ZK4W49CWYK9YU727138QUQO97316030OLI53Y	G02X	THW1	\N	ZRX5D	t	1C26DTS062N82	843	52	2013-12-27
41	20	14	15	42	BCRZ425CUX0R	Y	V	-1551788094	F	t	5S	\N	Z2NU27D3I4D	1970-01-09
42	29	38	8	9	X1BR6	V37	ORM0LNY0B47F1VNYDXDUU7	-9490	\N	t	EWFUB44QSLHUD33O	-767853542	F02ROJ	1970-03-24
43	33	25	18	29	I0	21	P5UPV45F787B0Y4GKZ064W2	\N	\N	t	Q3HY3B13JO539S2	-1079	4645GWVJ7A7654	2020-03-16
44	6	49	13	18	Y595BIO3	L	I303V1L148661ATZRX	\N	36I	f	3XMIEDU7T6S2538LC7R7	4	KBW8OL118P2Y1D7VP7900J9Z8THA	1986-09-16
45	43	35	36	36	WQA2H32604J42OSK35G14	3	\N	-685703585	8	f	1D7NH3B6WM70XG46H5ZRNF208S3	6	G192ZDK4GJ6W0MMBN3Y90DF65T413Z327527W33D9HH799M6R9RWG8M07B425RQD4MF929X4571	2008-08-13
46	44	14	20	8	E1FKJ0C22	P6I6H	278	8	KP61J	t	\N	-741	4AI7E7439D47NG5	2010-07-18
47	44	36	24	11	33001V2Q9	AL380	2MK8W774K	8223	Y	f	9AR91Y	-1499210292	251K675V59L1KN4AQVV12999M	2002-10-26
48	41	22	45	47	38CMVK2535AS344Q414	YG	CH111OSAW4M6J26RI288T324N04I83C6	-1564841578	N	f	49	-522984686	1ASRS99F3L8825295BWV2E	2016-01-26
49	24	18	33	31	Z55AG27D4J34DWWFGUA4S61B0ID9I11J	8H	NQ5IF6	-610	\N	f	KM660NXC9WF392KE6ZV6WE90O8Y710	-1331840282	2Q74RX6ICH12B94X16	1979-06-08
50	28	16	15	31	GCE7EK0415AD6X08R	8D	3U0INRDN27HWNUG7MNAVJ9ZW60RASZ91A93XP75PG44V40O5Z89S701	-1301362030	H	f	V8B9T53K493692SU	-673106630	\N	2023-02-23
\.


--
-- Data for Name: bsc_proyecto_actividad; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_proyecto_actividad (id, bsc_proyecto_objetivo_especifico_id, org_persona_id_registrador_por, org_persona_id_responsable, col_pdca_id, bsc_proyecto_actividad_tipoactividad_id, org_ambito_id, org_centro_costo_id, bsc_lugar_id, nombre, descripcion, fecha_registro, fecha_inicio, fecha_termino, incluir_en_pao, porcentaje_completado, observacion_control_gestion) FROM stdin;
1	12	22	1	27	44	18	27	\N	\N	3Z5Y08T89SDRAP7WVVZIY206DVI4F4GG6629O	1980-02-28	1970-01-25	2003-12-21	t	\N	90BPQ2L53W3P5R2Z9FO
2	27	14	21	\N	37	6	13	22	XA81WI	\N	2022-08-01	1996-03-06	1970-07-12	t	-3710	2Z0S278B6R03FIF4
3	9	49	34	44	31	36	50	29	\N	3	1970-01-23	1977-10-25	2015-05-28	t	\N	JPR56731Q4M4G7105
4	22	29	30	15	24	\N	\N	17	0Q970XS08PU2SZV0PX4NL7	KT17	2015-10-05	1990-04-08	1974-11-10	t	-1534277472	525PN
5	46	38	31	41	11	6	20	39	2	\N	1970-01-05	1981-04-08	1970-08-13	f	220	47W9
6	16	24	41	3	9	35	16	48	77C5B19F2V	DP34RM2JE34A76U9D8	2004-07-01	1970-03-31	1971-03-24	t	-117380770	C2ON667K24ID0X60A6BZIN4Q79R
7	38	35	2	2	3	24	7	12	RNY58JNXJP1	3O7A6Z3FLK20X2J589UVQDH	1972-08-17	1970-03-29	1970-05-21	f	46	6ILFY
8	17	5	22	31	\N	9	30	21	H5O178VFBMZF9	C3ZXU843W91WPQY0B0N19T31VJ17R3C34HF69O2EG862D3A5NTRPN2ET7TA9Y75899U68A62NPXG8DZ43B70Q3Q709H7464GKHU4	1970-11-19	1970-01-09	1970-01-03	f	-1618548237	WBR711K22R27183P
9	30	9	14	49	14	31	\N	\N	0G1M1JL3R62	\N	1989-01-06	1970-01-01	1977-06-11	f	-95	4FKG85R9C5D16
10	37	35	36	38	47	43	11	2	91VL8MF0CH6DJLY96T187HM2CV2F	\N	1974-10-19	2015-06-30	2016-05-02	f	-32	966TJ006P2JSL11USH6F6JE5E3VT8G69O093WIAR3KPN4A9
11	14	17	17	32	1	\N	10	47	QKC8U	9THI367TKD	1971-02-09	1970-01-18	1996-09-01	t	-703853582	K5678XJW4T72KRS9T0TA32J423A8
12	36	31	18	31	32	\N	17	28	3NN89KK65898963NLSR6NH56VPN	0AS6Z3X	1970-01-10	1972-02-14	1980-05-01	f	-542813800	107AL867FV0ZJV406F7B9OP4QX7W78T9E42TU59172ZBM
13	14	11	34	45	33	18	9	42	T0	01B	2007-01-28	1970-03-23	2016-07-30	t	-757380840	43LBB7QU4UOII991U0U
14	7	11	32	44	38	\N	27	19	RSI8Z8	N21625TFA8Q7BV8	1978-08-29	1970-03-05	1988-01-22	f	9	P4EMZIF4X0G2TASS7
15	9	7	28	26	7	11	48	42	\N	7	1992-01-12	2017-03-20	1975-05-16	f	\N	TT7L55E14LPK1G5K92BE
16	32	18	44	30	40	34	2	43	9097CQ3QI8YQ50	YL4V6RIT5K072817VYJEU3K748L8K361NB10	1986-07-05	2011-05-25	2004-04-03	t	-1524911993	914
17	9	34	32	44	44	\N	\N	16	3	XTL2US6V	1983-09-16	2017-06-20	1972-02-21	f	-316	6JJ5C0UPP6E18373VO6F83E9ST7
18	40	28	32	34	26	50	\N	12	4N39272VDV	8T89	1990-02-16	1973-03-28	1970-09-24	f	-804	\N
19	22	20	49	23	24	26	33	17	5194DGSV34KW75	KO791VX46WZ556VG5C5066H02ZHLXXAJ9KT426	1971-09-27	2018-11-13	2003-03-02	f	-1438864957	KV1XHV2N22
20	43	8	8	\N	28	46	9	19	7ESOIW48OLDV24L7ZSQZ302C4HG55ZCHKQ65615L5XU34S	EGN	2005-05-02	1996-10-10	2006-09-26	f	-45247357	146Y72Q483E72H539719M176UVA32M99DQ7FX9WC3K6IERBN6S1RFIIS6W1RW716M0Q9NNT94
21	21	33	38	20	42	42	22	5	FO36LXQYV	6100Q73E7XNJV8QMP41F5287D39R33NR1YEYNB374D	2003-02-06	1994-01-30	1970-03-19	t	-343637371	2JS7I0GB11DEF5HF0YEM35G7OXY7JPSFNS043
22	38	22	14	18	\N	1	45	27	01D8UPS8	G359MKL4SB5548I7NY1	1979-04-05	1988-05-20	1980-03-12	t	-879963597	8UI5MS888477336VJ9976F6P996NL0N53JDT5CFGBDSX0JKIH94T7E3WA1HVG0L6JH892SQN5D21850748760W6U59DRQ0J3LL7G8FEFL6B2Q49
23	15	32	32	\N	11	48	22	13	P4RL02KP34PX037H026VS60D	6K6	2021-02-25	2000-07-25	1984-08-28	f	-1508266432	3
24	45	32	29	26	33	30	13	34	0T344F3H5W3VB88I086345OGG9GJY8708017E6Z3BY07DI2SW7	Z1N2H076ZL3K	1970-01-08	1985-11-18	2014-09-17	t	-389821505	UA8YK59701H6Y27FP9D8Q16DQLYKQ49K1HYE53IVF524
25	17	9	36	6	44	19	43	42	M	9VN	2001-08-24	1970-01-06	1970-03-24	f	-2061244588	BJASY36OSZ5718671782JC5JXBE215MHI8CS51T42J8P6C6A7XM1O4NO26BL3QP
26	9	11	30	50	6	48	9	11	5DVB3XAZHL4ON48LC4164J1A5UJ	JQN5443VD34XJWNOMEP8P6026R	1983-10-23	1970-09-30	1972-05-05	t	-700646729	U
27	6	45	20	15	46	43	44	34	2KKPS25FCR5Q0RK2OJ6E5VCW1HJ	TV4B9S3ZC7PQ1AWS989E81B66N6ZD3YYS25909R	2015-10-02	2015-04-26	1986-04-20	f	7	R
28	32	37	15	4	47	27	10	27	\N	QM9D400K17Q3G3IC6864ACG0RJ60LFMG0IA334V6O	1971-03-17	1970-03-08	2008-09-17	f	\N	SE56D69I954
29	28	3	24	8	27	4	5	44	U3WK3G3QD7HKOG2J7R67L8XKRH1XR6EJVJ2K6B	V9J20K	2020-09-16	2002-05-14	1988-10-12	t	-684464573	L9CTHJI
30	39	1	26	34	34	35	23	10	9	47055XS6CLR93QBA8LUQ	1995-08-04	1970-04-10	1974-11-25	t	-2101299514	IHUSZA
31	20	23	39	13	13	25	5	41	Z	EL61LCHCFJPIGF6Q3NB	1970-01-08	2004-09-23	1984-09-17	f	-966202657	75D5XH6P1O14L3B3IMX
32	29	40	2	\N	\N	40	46	16	\N	VC2GTX2IZF872N7U57D00NZ18OWEKX093VV769	1976-02-07	2008-03-30	1970-09-13	f	\N	O1U89SH3WRB8
33	26	25	4	11	48	19	38	\N	C77X0UNAW3V2P6VJ66Z3GDP4QQB24M00K68V5U91PO39TS2NJ6	1075898450W71VF2R0QLC54PP9J7363PSA08I5P05X	2009-10-07	1970-11-23	1991-02-01	t	-4	1XQR70ST00XDCJ42UCXO3034JQSBK9NGH422914UIR51N3YBJZIRW8WGQUGB42QRD1P3J86Z5D
34	34	23	6	32	25	46	18	19	\N	80	1984-06-20	1970-01-08	1970-01-10	t	\N	\N
35	11	22	26	15	45	2	6	\N	1W2Z03IKW72ZL4D3Z	\N	1970-01-03	1970-01-03	2022-07-01	t	-1313783738	G19ZL
36	8	32	25	16	7	36	40	49	109KSK	2S8NX4O48N01CLH92L2GDM1W56I4KZDK8A45595140664952H7791FT0FTZ3281A0	2011-10-07	1988-03-28	1986-12-08	t	-1164721018	ZRZ1HME6AZ7V7361PZ5
37	30	37	39	10	2	43	31	\N	977KB558R271V6U1755QEJ54SF361	71RE9Z6D2N82G26Q8V	2019-11-21	1975-04-01	2002-09-17	t	7	2K7RT
38	12	38	3	5	19	50	6	7	74	UPRW3EJ8E	1980-12-16	1978-01-21	2023-02-05	f	-1897475145	04633L
39	35	40	19	49	36	39	17	16	\N	Y4X	1971-02-15	2001-03-03	2007-04-14	t	\N	4EWBE
40	29	1	38	46	37	47	12	4	98W7C74KJ6N091DV2106B	69DS0Y0WJ	1970-12-13	1979-05-15	1970-01-09	f	-1746939610	90PN0GC22M8204V0
41	37	36	49	40	\N	7	\N	19	6B35MG2LX43MP80109P1830X000HH065608J2Q	9DR4W9M5O73JD7PG93T7GAW7GV14T61CS1Y2ZP9SE1	1970-09-20	2009-06-10	1970-01-05	f	-474850677	DHP7Q4HCJVVNXWMMTC8R1
42	10	15	50	24	41	32	33	20	4S798O9KF1971TCHW1S	P9G0188A99J678FSF9K15886F9KAZ3IQ60F0ENZU08NI3NQSYR737SC1Q89930GIRVUJ0L340173KN	1970-02-01	1980-10-23	1984-09-20	f	2	81X917YYC26N5X20ZZ70U3CL9JRM8O0I600LNGTAF00X12V7XK77617WV2Z2K9P1B7QGV274VEQ4GRW69OXJ5OFKSP904TZ7864469XE2958JS53UMGWREB218BT4311K8S25X73JJ24P
43	4	49	48	42	29	34	6	41	\N	QD	1989-08-23	1990-07-30	1997-10-15	f	\N	01231XL42848NLWPVBIA2Y528T06EB620COIA11OEVO8CR07096OF660OH9B1620R4LHBJ4JA9CMYVU8K
44	40	43	16	18	35	32	24	47	H9	072VLA7VFO9GEET97551P689AA	1971-11-29	2002-09-22	1975-07-12	f	-142694857	2FR1JL27MZBDQ46614715478RWX
45	36	20	27	35	16	32	21	31	3360H2N05NGN67Y1FT126HWH4B8928TKWEY9Y6G607GL9K52E9	Z0B	1970-02-12	1982-06-06	2005-08-10	f	-1443781299	AH225P4
46	21	41	7	19	\N	12	32	48	S6HHC0QN55M309MYJF9IQY57Y5I9A0SM3621BEM67NXYA54151	9TUIQ8UYU8FHEUG3I6516HPW10462N4RJ4EA39PSTZJ72MXG54M9I60ZX713691LD7Q29DH	2009-01-30	1978-06-22	1972-02-26	t	-4002	4QGK0JYI
47	12	15	37	12	46	19	43	6	0E29	669E1D9H06H0626N23DJC469HTR51N68BI7HI88	1981-03-28	1971-11-18	1971-06-27	t	-192788619	5C8JV3NNT0AW136O3EY0J13REGNH5223H6
48	21	8	17	\N	18	29	47	2	7FXDU5109CVHK	93URN4L11AWA1A6H9P05K2RG8K712G5R7J3	1999-06-06	2005-05-20	1999-08-18	t	-772128507	22022RM5X6379EBOP6Q223037
49	22	1	17	49	10	44	33	33	1	3	1970-02-04	1978-04-29	1975-09-05	t	-2	RD5F67F2J2Q0N8207E3V651R8046JOB769325RFL
50	4	7	49	7	2	4	37	45	90B88609J29L910HMJ14N265MY410OH1O30V2P651316U0B3F8	9G8M	1970-11-11	1972-01-07	1978-08-09	f	317	\N
\.


--
-- Data for Name: bsc_proyecto_actividad_tipoactividad; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_proyecto_actividad_tipoactividad (id, bsc_proyecto_actividad_tipoactividad_id_padre, nivel, nombre, alias, descripcion, orden, fecha_registro) FROM stdin;
1	16	-960770787	SKW4CGHZ6JIR4295V84LW45UUV169Y	D	JBG3MXW8S1R4G6CQZY307L45N3GU800WV0	-2138696191	1990-04-06
2	18	-1688451208	190S	9B2X4	N01265SF3Y4W3XGG49766W0211439DAM7C40N612X4QT0BT5UA1581IJR0YH4PU8MZ4O	-44	1980-05-17
3	33	-1209556718	5WBN87E4L18VF3	676SS	G2C414XCEW8RB84P2T74DCL5R1Y64E5O690IRG	-181886139	1978-03-17
4	23	-1431985427	SI5332960B5LE19NH66TB8FKRA06ME55F80	F509P	6Z80F	-1786021191	1996-07-16
5	45	-1212835018	998TK	W	7B	-347511292	1987-01-01
6	44	-290650586	QIXGF1JL	3O	782SJ68T4TCXA	-760707781	1980-08-08
7	31	-1177793687	87L54Z3R264QF	4	4JHF39X08930SHCBGP142SC07JX449VVMN1M	-7917	2017-10-30
8	6	-20	Q19	I	1Y0L1GRGK3O1	-1148996508	1970-07-29
9	50	-1676269008	T1Z41L8F04Z799GP	MQS2	7STPC78MAS6Z8D33U3K36WP20B3ZX12E9Z	277	2020-06-19
10	12	-475616191	11R9B861LFW2NR	4	\N	0	2006-09-14
11	4	0	0DW7	KK	Y2V9G1075V1U92EF39HN91FS3	-972170903	1970-03-19
12	13	-2074572478	QH7B838146V8N803NEFG3T	138Z2	\N	-1279991894	1971-09-08
13	1	-610527497	ELRUQPW13GTD4US80W3G0W407W12S07OCXLTWA	8	23	8	2012-05-16
14	16	-1599683095	21X4W39L	\N	\N	\N	1977-12-31
15	3	-1593781838	76174663C9953L	531	L28048OZ4JF9MP	-887874057	2011-01-24
16	43	-1531223154	E1W3225GR0F2PXX743159J360QNU2V8E548IX02P593RUF6S3G	9R9	Q317ODR7ZFPBJQRPF4GXTNC826305C45E25IH5SY	-58774921	2020-11-09
17	10	-1422077268	W0XI5E021	0	A57G74L1JMI84IJP5G08724B259LP	-1294512627	2018-06-13
18	38	2	5524OO7	5	B881DD673X018M5FWNREH62NU	-788633446	1970-01-03
19	46	-932656654	DL4C4371AE611G5	XM3	18ST	-970	1991-03-14
20	14	-128	7H	Z	8CK63ME2W01	-63414589	1973-07-13
21	33	-51641641	VI1ZVQ8I5	Q1	2175WMHMZOIA	-1745897361	2003-06-16
22	43	-23401252	63E2LM6H059X77A	Z3ZX4	65OI4Z8NZQ28OM4BN3H1R4	3251	2019-10-15
23	46	-678824913	\N	U38MN	XG9WT8ZH1HDE12KM12D6W84TZ0PT306C6D89XHG	-1039295669	2005-08-20
24	12	-799355610	664	Y4A	378C5SO	-1435001924	1973-04-17
25	48	-2	YTGJ086	\N	1JZPN1MT	\N	1970-07-28
26	13	-185812937	398X95Y8T	4	L7B0O0OROK	7	1983-04-18
27	29	64	YQ60J1JU45XY97J	79	0GJ813BI5OBV0R5AIE1623XH	-8	1970-01-07
28	37	-1939143590	W3035ET4412H938FY872Q62C9O0J56ZUOU	Y	7VNN	-953006534	1990-04-25
29	1	-34	5MKD	\N	5N56HU	\N	1970-12-15
30	14	-1466522702	\N	\N	\N	\N	2010-10-03
31	7	-1098779406	VQO	L	E3	-491752027	2011-02-25
32	29	-231122349	8E4XF2DWUZK44KMS8D	532	IN	-2036106880	2020-08-18
33	30	-667174579	\N	63C7	PS63A42V7ZI8V0K	-2069733261	1983-11-05
34	4	-1375987770	DI3	II97	A3DF57Z5N46E890L6QC76186L8393126ASE10FYX	-69	2016-06-25
35	11	76	6	22MMT	898	-110987346	1970-01-08
36	6	-32	QP3595L1NOAA4L8	\N	X96APO61	\N	1970-11-26
37	38	-1566624721	P46N3DQ07RWCH0ZFG8CT731W0XF60330ZT710F2ERVO	B	3766F17PG73Q5G1657	-6	2016-08-03
38	27	-6277	R15547V22UA656P5N	46F	G132P6YO	-545652620	1987-03-10
39	25	-487385318	G4IN7U7E1U	\N	\N	\N	2015-06-17
40	1	-970625007	8A	AX	S69KNBT1Q06Y7XV1F0PI0F111414O8MNZ949JJB2	-52	2012-09-07
41	30	7	7FRVV6EBDI1F8TPISJ	0	S	-737	1970-01-08
42	29	9582	L1999K6X0RSG97Z9W7SZ0	B	\N	-465075708	1970-04-06
43	13	-749589412	RM08116	\N	9Y	\N	1976-07-22
44	34	229	WXK4717	YOA	T783V	-1538708039	1970-01-23
45	36	17	LO4S	PHX1H	R1OI964G75LLE	-684580765	1970-01-02
46	50	-1440072215	E6Y55YWTN96R6NC	\N	IGOA1U5	\N	2023-03-16
47	46	-114676260	5Y71	0	DJOM69MD40MS	-1774492222	1972-12-10
48	9	-911627729	K92SQS28181H6925SC89QYO2RE5F26LAHZ7MPYV00VP	12D	95UV6WX	-181	1995-10-05
49	45	-1576744012	\N	G49UW	880C33LFV722	-45424928	2010-12-22
50	40	-1323045606	3	G	\N	-1227191863	2005-10-07
\.


--
-- Data for Name: bsc_proyecto_inventario_recursos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_proyecto_inventario_recursos (id, bsc_proyecto_inventario_pedido_id, bsc_proyecto_inventario_item_id, numero_fila, cantidad, cantidad_recepcionada, solicitante_no_comprar, revisor_rechazado, observacion, fecha_registro) FROM stdin;
1	41	14	-199579705	1	1	t	t	K9SP0ZEK9UI57S1	2005-01-26
2	41	48	-953703990	2	2	f	t	Y39O4ZQ0D3O63WE0W45VE607GWJBR026HORTL4KMXIINO3L9807UUMAVB7NZ88A4EW61L57RRT4DK1HF6VFPN243039R24032SAHT7K08T7YNVM3B0NNHT	2012-09-27
3	5	18	-1035157082	3	3	f	f	29ID	1974-01-12
4	50	13	-1583277730	4	4	f	f	\N	1992-01-20
5	14	25	-769654739	5	5	t	t	P254XDZ469NJV8N0U5EP8E4SV96432631YJON	2004-01-15
6	23	45	-7	6	6	t	f	WY4I40	1971-12-10
7	44	3	-47	7	7	t	f	6U4	1971-04-18
8	20	25	-1360736445	8	8	f	f	4I15	2015-08-29
9	3	36	-627172662	9	9	f	t	8V39WZ1TY9H23	1990-05-12
10	36	16	-2094674672	10	10	t	t	1N9X0Y614JJGAFBF2X8731L7W0Z	2001-04-24
11	32	50	94	11	11	t	t	MGRSM6X2H2G0C	1970-01-10
12	37	6	-2085205407	12	12	f	f	NX17LL6DV12E169DP4VU	2003-11-23
13	34	1	-161376332	13	13	f	f	GBID14HGZ53CX3Z8	1990-01-05
14	1	41	3	14	14	f	t	JL91L2CKW	1970-01-04
15	28	24	-191049936	15	15	f	f	I2L12519VP93	2006-06-02
16	41	25	-888183312	16	16	t	f	CHHQ335SG4ER59PBHPBSO4AUGIXY061PC520Z5C859	2009-07-01
17	27	3	219	17	17	t	f	70P471CAC5RL82J1R53HI68	1970-01-03
18	16	22	-2127229963	18	18	f	f	YFLG7X5HV60JL04	2006-10-22
19	5	5	-1519227078	19	19	t	t	39	2000-08-20
20	20	43	-849106649	20	20	f	f	811PZCOI7BH1RO3	1993-02-21
21	7	44	-109769722	21	21	t	f	P73N32DE2	2012-05-24
22	20	28	-1363597185	22	22	t	f	X	2021-12-27
23	33	50	-476052803	23	23	f	t	7YSI4	1990-09-09
24	41	16	-3762	24	24	f	f	6OH94365	1980-04-20
25	9	18	-1792493381	25	25	f	t	EZH34E5T0PY1M26Q87DQT3Q7HM5	2003-06-27
26	2	30	-2017460242	26	26	t	f	V003H4UP4HX2Q931OZ1H88IJ7FCZ3GH5CJTN78Z50GW7FN48VA9DP22M56N8G5GD558CJ1KYI4JQMG8V6H39V94B2SZQ	1977-10-11
27	12	47	-7158	27	27	t	f	\N	1989-08-07
28	46	2	-955575696	28	28	t	t	590R8O0R3QZ1L6L4MP4Q8F	2010-06-13
29	28	27	-1557699465	29	29	f	t	Q29L1K2UH53I11GZ9F50941I0CA54Y1HERWG1ZMVC62Q8Q01	2000-09-22
30	29	48	-1096964953	30	30	t	f	19ASP3O6	2003-12-05
31	36	36	-1266517675	31	31	t	t	M8Y2S493186VK150399YTB5PUA4M8487DLVMJ4W	1993-05-30
32	5	25	-324039824	32	32	f	f	F6AP7BKBC712U9XI4	2004-05-08
33	26	43	-1419439535	33	33	t	f	122S9JA	2004-07-03
34	30	12	-578	34	34	f	f	25G81	1971-08-02
35	12	19	-1498487977	35	35	t	f	PDYS129JSGNXD0IUPGK29	2013-01-03
36	42	17	-1836541669	36	36	f	t	25GZVNCL5G2K80223RCS84	2017-01-01
37	50	17	9096	37	37	f	t	TBJ3O6N162T700G99809DJH40493285W626OV3	1970-04-01
38	20	21	-793174052	38	38	t	f	\N	2016-02-20
39	13	2	-1209217159	39	39	t	f	0	1994-03-31
40	24	8	989	40	40	t	t	S19547Y20BCLDNVD058	1970-01-10
41	15	26	-556174715	41	41	f	f	AG06T6HI82559G2YDZO	1972-02-06
42	19	46	-355	42	42	t	t	8B	1979-09-26
43	35	2	-1347071496	43	43	f	t	2HZDL75X67N41	1986-07-12
44	16	28	-1128560068	44	44	t	f	ARN063RCA64JJ9DOZ	2013-01-09
45	21	40	-574	45	45	f	f	MT6QO357139	1985-09-27
46	49	9	-1635275330	46	46	t	f	Z748P92	1983-07-08
47	3	44	-1537650166	47	47	f	f	A1J46BA3U77603NU2GS	1995-08-06
48	31	50	-1609963768	48	48	t	t	B92YPA4A403DX5	1988-04-16
49	19	39	8	49	49	f	t	X4F25QQ8OGE	1970-01-09
50	15	27	-1285457601	50	50	t	f	218U	1983-03-25
\.


--
-- Data for Name: bsc_proyecto_objetivo_especifico; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_proyecto_objetivo_especifico (id, bsc_r_proyecto_linea_id, nombre, alias, descripcion, orden, evidencias, logro, fecha_registro) FROM stdin;
1	39	FW858L4K721ED8DK8R023A7RR3174I	W	G64RM6RPLJI03Q9Z4ZOL2RK3R1Y93GL0VSW3F915KMJ3	\N	35598	-47	1970-03-02
2	2	E9XH1O3647685LW2WU0Q7P7	M39KQ	12Q	605	71241	678	2012-07-15
3	1	Z5QNT11W2JJ541B7G	OV675	6VA0YWN234A571VL6C7QQ0PQ	-859479288	67733	63	1970-01-06
4	33	9SHLMB	1UQ11	QO	5	92645	-1803321646	1988-01-10
5	49	36N27UAZQB0SHN8674EZ8O53O8514X6	\N	\N	-658	14607	\N	2006-11-05
6	45	5NGT0830	66	\N	-1585614115	84255	-2003601211	1991-01-05
7	26	2TVNCD2T8K8356Q9FE5AN4X0WGJ496921V4X8DP3G49R5B3PE	1WST	\N	-767	34458	-44	1993-10-20
8	13	1LMZVN6	\N	E05TM	\N	43246	\N	1988-02-13
9	16	11C6IL7	J5136	MS4VMS46V808004Y8KQT	-555396541	83708	421	1989-11-23
10	11	D49D7R5	85334	3X300MY2I775FY1GW7	-847525714	66624	-1759278508	1970-01-06
11	48	0QC	\N	VBR6CRNECP6552ZRL2H3X	-732744404	85800	\N	1984-06-17
12	20	54BE5368UCI1WP5685YSMGJK	8	18XXEOB10P3BPZ0BP3N4Z0H9EX3478RHZC593	562	82463	-368139075	1984-05-22
13	43	S725ETQH2TWU73CB510TTD07G	2	21N329MWZKOG05	\N	13654	81	2021-05-18
14	12	1RY9	\N	8Q7G4N3U	-528	70798	\N	1970-03-30
15	21	UE72GRA1	1	P322C01Z7E1C6U9	-525	53451	-1837531116	2003-06-19
16	19	Z4T3J0EZ56LNAE255Y9ZA37XN5A60Y14D	9UZ	1GX2T4F	-1271645830	12158	-720914898	2018-10-04
17	11	4	O2H3X	\N	882	76792	-1892746399	1970-01-07
18	32	SV4NP5PE0SWS3M6GIU4P3	H	\N	-766274211	78746	-96665788	1970-01-23
19	14	YS08L8XP7NPY731	9E9	MM91YZN25571Z2ZC	-387086336	78951	-4	2016-11-23
20	40	7X371	2K81A	1J4930WK2	60	55196	-1200829216	2001-12-17
21	26	0S567SPT57A6410WJ60G420039GF51G14ZRW38BZ5BQ057B	5I	PHZP23	220	61572	-6297	1973-10-21
22	42	53532EH6155P8TW6151VDLI907UQ6CX9113J498K21V	4DCP4	DOI5B876520M3VE457913UI54MI23CCVMY9010XIEVQLT	-1054488620	66371	7480	1996-09-22
23	41	UXI8M41X6OP	L	OY1R	-1974638417	23159	-1428365309	1970-01-05
24	8	5	4Y	68M6U35781Z4E0B5C2KD	-2001428282	02550	-880197410	1970-01-12
25	20	YN97957	3	357	-2053667043	47372	-8	1970-01-13
26	43	5FD79N05	0	3D98SDJ2L010	4	71495	-1475652336	1971-04-11
27	34	OMRF55SV	S	2F601OIEG77H3K9209K676BCDU2XY4HQ2G	1154	07709	-170611721	1990-04-27
28	48	XEK4YU436YMVHV32R7ROE2JA98Z	8M0	T335GZ5	1246	61100	-1208350118	2001-01-19
29	10	6099UK273T	4	7TAT	-4	64551	-924976914	1997-02-21
30	39	60RADA85DGGBW7N44R3ETD2ZXLZXO10931BIIJ5BVF1R470YK	PWO7V	4535V2MFI1GS5HS80BC7P9892HAK76CK68O4	-266673057	92267	579	1971-01-29
31	2	09P3OQ187154XI1V33I1PG7	K5UXM	0E97B6L	-1173662238	77500	-1862310596	2018-09-26
32	31	861K46P21141IZ366E7J3L9MBEA9Z4J	\N	Z	-130162181	73198	\N	1997-09-26
33	45	HPU	0A	5EY38AA8B4P315XIL5GP530F055BEQE202A8L2J1B76SP98I0	-39	45598	78	2017-10-27
34	28	3O987NXAPY82N933UL2F95HDAPO748NHT9XNGNL9GM2JQGPKC7	\N	EW6KV92YO0D08T331L3B57OXDIW663MIP039O1IQ3R7RYV	-1900301551	15929	\N	1980-10-17
35	28	3765J57BYD3H0FNA0U2VSQW	8	E7A	-1480523073	90011	-294902718	2000-05-21
36	11	081Y	\N	0VJ4AER16MZJ27C727SBH952E6GS8Z9O30RBN52R2YJ8K9IW57PCP231I7G90IYE91K	-1867453855	24164	\N	2020-06-19
37	6	28W4KEQE54K84N84P1LW8456398NF9969A29G77N729GNW	\N	X2723OR44	-424116120	83516	\N	1971-08-04
38	5	97Q348S	6	\N	-1647885225	47143	-1394215907	2006-08-09
39	1	QDVE3KL0376MORU2VH43J25	\N	8XU8	-446255035	53218	\N	2021-04-22
40	19	3U5BB	\N	9ICD2QKJ46L2I460S8329O	-5	75195	\N	1994-02-17
41	12	V9R8J2A	IR	RU00P72F9PH1XJ7K523XO423DI9I3791M7EX	-774059236	87690	-550	1983-11-27
42	12	9QSFLTSSJ16Z4F11EM7FDXY22ULNKB08G	G	6B	-1476185432	60997	-337536938	2012-08-04
43	31	Q4J5213H97D5GVGN983TJ4FWXWW7	R1	9221260F3013Y3L295	-1980121496	24139	-84715109	1978-06-09
44	28	06K2UE509KVJREC1	63445	6N574E3BVX9N7M2UQDQLD84JRO0H	-1421198821	73506	-1369501121	1970-01-08
45	35	204A4A241X4SFFSTBM2XH721R1L	883N	U4EH6YB6KX49V2HBC428LLQME36FM835C776993E	-1728209883	12306	-38	1972-06-13
46	8	W9013759	5K	\N	-1298571044	72277	9008	2019-01-30
47	35	ARK1IQVWAG2	8	6O3Y2V0WR4PE0OV	7	72317	6	1980-05-19
48	15	3IJF8433O	D	627A29V07EX35	-89	26272	-1715706812	1970-03-10
49	2	6HHG68O59Z63176WCI05BFH3LAEL1450I6WWY45W87JZJQVR00	35C	C4VKVEWA30T7I	-259881153	70372	-1703855892	1979-02-28
50	20	QL7	97L1Y	7T5478P1D5QC9CJ4659IP5M	-624052283	57785	-1521261726	1978-03-06
\.


--
-- Data for Name: bsc_proyecto_pedido; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_proyecto_pedido (id, bsc_proyecto_actividad_id, org_persona_id_solicitante, bsc_proveedor_id, bsc_tipo_documento_id, fecha_registro, fecha_proceso, fecha_cierre, descripcion, observaciones) FROM stdin;
1	14	21	41	40	2017-11-08	1997-04-13	1972-09-02	5	6QF1F
2	44	29	16	21	1970-01-06	2011-10-07	2007-01-29	\N	Q49K9J5DI3619N7RB7WKZB0DX030BD83U8
3	23	9	36	2	1988-08-17	2023-01-06	1970-01-08	0860Y1B3IOD9K5YCDZNSR9Y0KH07CV21458T	42AJZUQ81
4	4	20	47	4	2016-05-18	1989-06-06	1970-05-29	K6KJ1EB9G609LX362309R7CZQJH8M634K40U35Y707	6VFKKGB4BXJ24
5	43	19	37	34	2006-12-13	2009-06-15	2011-11-11	O1AS4N8P721320TMD5T5X0Q302A4QQ5QX5FZ3OW2J37IFXPCR	T3IB9ABMV0Q
6	42	28	43	11	2005-11-12	2014-08-07	2001-03-19	FSQBMKV	72QG7S2I63G9J1TVBJSS6ON4CU226M870O808QY245G23P14OJP1
7	7	48	31	12	1998-08-21	1987-04-23	1991-09-28	5	P
8	21	26	15	14	2002-12-04	1986-07-12	2007-03-16	OU7SV94KDP	DO259130777Q7F57RCRMM4RM3DKKS
9	39	12	9	28	1979-05-10	1991-03-21	1974-07-13	\N	3ATJ3V79Y
10	20	37	5	46	1982-12-22	2015-08-22	1975-08-25	7771Q1EB606	5J
11	30	11	31	16	2020-11-09	1978-06-02	1994-10-12	\N	NL5140ZSUQBVR3GI96F3TL0B50050G
12	6	19	46	39	1986-08-27	2022-10-30	1971-03-01	\N	VE647WNQ
13	2	19	14	9	2003-12-28	1998-05-22	1978-02-17	N8H21NT73274	2M5Z
14	39	15	5	42	1970-02-22	\N	1971-06-28	\N	\N
15	41	5	16	20	1983-09-03	1989-12-29	1972-03-30	\N	D
16	15	1	1	37	1990-10-05	2006-07-13	1970-03-17	ZMVS	9B
17	33	29	3	7	1998-01-30	1994-08-29	2016-07-19	1L2D31HU5PF47E69	NX847IO7775G233M9F426IDT21DBVPJ715HZZC4X2U0
18	50	2	8	4	1970-11-15	1981-09-19	2003-04-06	562RGC6225M836T68VLGF5	F494H671U756P8K29O9OZ3Z1004J4
19	38	32	17	17	1970-01-08	2000-08-13	1992-02-21	\N	S10336W45S684
20	22	10	5	50	1989-01-24	2015-08-01	2013-01-19	OMUGR7YF1IZ5I	6C9I6P3K22S1MJVH82H8E1BX7QZ9OR
21	27	47	17	37	1978-12-13	1970-03-22	1984-02-13	3W1	F
22	47	33	21	45	1985-12-23	2022-03-30	1970-01-02	C8WI6JS6NRW3O86SRHF7H564595PB6	C4H0
23	23	49	6	48	1988-08-05	2014-07-17	2001-02-03	\N	1V95JEY6
24	29	18	35	8	1992-10-18	1970-03-28	1970-08-22	\N	I4IH9OX65RY0F665DHL98XB9ARIDQ1XH6HEEE78D9GE8
25	11	18	20	11	2012-03-21	1980-06-28	1970-01-09	M34GF4523DK822X761S62XBYW5JA1B1O91OX92432A	D0028OP0J24812R8B2R7LT41F400
26	12	36	48	42	1990-06-09	1995-12-28	1972-05-09	\N	6SZAL68J7L
27	5	34	5	28	2011-02-17	2010-10-08	1976-10-09	H4	5G5Y788
28	36	20	13	2	1999-11-25	2012-03-15	1974-05-04	9Z3WM9TUV9O6VZ98742KVG7Q5279WWS	VXQNAU3M0PD2C0MAC3
29	21	38	15	8	1990-09-05	1971-05-30	\N	O8G34S3XX6CG315FD7V	3LEC254J7HPAA96JYOK13J1T4HFUKA579Z37QNUGV09FB30NXFP7YW8WM53IC0KUF8TLGE1
30	6	24	15	9	1970-03-22	1970-02-16	1970-01-05	1589	OM
31	1	7	9	39	2008-01-06	2005-07-04	2007-10-26	J897V	8Z543C9RE7O8UNY1XOK9U
32	6	32	8	36	1978-06-13	2015-06-25	1981-08-02	88	920XTHBJZ2
33	24	35	32	3	1971-08-03	1980-02-07	1978-08-12	BC7L	054E8LY89HR65B2R3QEIO
34	46	33	41	2	1970-09-07	1972-05-02	1970-01-01	K8QGXE03XNJHT	HO263
35	23	14	10	3	1973-04-19	2020-06-09	1997-08-30	NDMX23177JB4E	X3EZ99P648545WD1
36	21	8	32	43	1970-01-01	2008-09-15	1992-06-28	899A9544CJZ5D28	W4
37	33	10	6	45	2005-03-17	\N	2021-01-18	EB1	\N
38	45	15	19	38	1997-03-25	2010-08-12	1973-03-02	R0A1IKEZ41094H1H765PDB710498V74F1G2F3SP8	173
39	43	32	31	40	1986-01-08	1989-11-14	1970-02-22	36711	CQN524081U638A1OU59
40	5	33	16	16	1978-02-23	\N	2007-12-07	IU6	\N
41	28	35	10	29	1971-12-16	1981-12-20	1977-07-21	TX7HPBH962K1619	1S
42	7	39	38	41	2012-11-20	1970-01-03	\N	\N	XB33R7
43	49	48	22	49	2017-12-22	2009-03-31	2006-05-24	\N	A0VA8E32Q56
44	8	20	45	30	1978-09-26	1972-12-06	1971-03-11	B2B	V
45	44	48	29	35	1997-03-25	1981-03-17	1970-01-02	\N	8EO6A28559
46	20	8	3	23	2018-02-18	1972-01-14	1998-06-17	ACQY62D789KTVT86WXWJ0	GOMO7W3WC7ESZEY9HT4WPJR99F
47	14	31	25	38	2016-08-20	1983-08-30	1975-03-04	3N4WV8QZ95CWDK188A	Z4WF00417J7
48	1	26	6	13	2020-12-04	2010-02-17	1972-04-25	944BKP4SCP8ZLL7E5L	0JD36
49	41	41	30	24	1972-04-17	1970-01-09	1970-04-06	9NP13EHRCGZ1M5J7OKTXODJ6T	3G10VLXWW7O25XDG8ID
50	21	8	16	35	1970-02-21	1976-01-04	1970-01-05	1E011A1Q	C5I
\.


--
-- Data for Name: bsc_r_objetivo_departamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_r_objetivo_departamento (bsc_objetivo_id, org_departamento_id, lidera, fecha_registro, id) FROM stdin;
47	47	f	2012-02-03	1
9	9	f	1970-01-26	2
18	18	f	1983-02-01	3
4	4	f	1986-04-08	4
28	28	f	1988-02-24	5
50	50	f	1982-05-21	6
45	45	f	2006-04-14	7
48	48	f	2015-05-18	8
46	46	t	2007-07-07	9
23	23	t	2014-03-29	10
13	13	t	2005-09-09	11
19	19	f	1979-05-06	12
42	42	t	2001-08-26	13
14	14	f	2016-11-05	14
20	20	f	1999-02-22	15
49	49	f	2001-10-17	16
15	15	t	1979-07-16	17
37	37	t	2006-05-17	18
43	43	t	2020-08-27	19
21	21	t	1972-07-28	20
29	29	f	1970-01-02	21
38	38	f	1984-01-02	22
10	10	f	1992-09-25	23
16	16	f	2007-11-19	24
5	5	t	1971-08-26	25
24	24	t	1972-07-04	27
30	30	t	1989-05-08	28
25	25	t	1987-06-02	29
22	22	t	1970-01-08	30
44	44	t	1995-06-05	31
6	6	f	1970-01-16	32
31	31	t	2021-06-03	33
39	39	t	2006-07-04	34
26	26	f	2021-07-06	35
32	32	f	1970-01-09	36
17	17	f	1975-06-09	37
12	12	t	1970-08-13	38
1	1	t	1970-01-06	39
34	34	t	1970-01-06	40
40	40	t	1970-03-13	41
27	27	t	1989-10-11	42
33	33	f	1982-11-13	43
7	7	t	1970-01-04	44
35	35	f	1987-09-22	45
41	41	t	1986-11-30	46
36	36	f	1970-01-04	47
2	2	t	1979-07-31	48
8	8	f	2002-11-22	49
3	3	f	1979-03-22	50
\.


--
-- Data for Name: bsc_r_plan_de_cuentas_departamento_presupuesto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_r_plan_de_cuentas_departamento_presupuesto (bsc_plan_de_cuentas_id, org_departamento_id, presupuesto, observacion, fecha_registro) FROM stdin;
47	47	-1449782671	VE607A0DI7S1XU09E4Z26W493Z99OD80T17W726ODU11874F213R24O74Z078641072B31R27K70K9T8I0UG7712F29ZT0B87Z23MU6R5X99X2Y8UQ0794DCNLMNCY6	1980-11-02
9	9	-162198765	GG898EV9	2012-06-14
18	18	-337558538	H1Q5X2I839Y37580ICVO515Z7U07KI6L868L0GNKMXE6829	1977-03-02
4	4	-40963295	9106KQ9C01GL	2014-03-31
28	28	-1144417270	FA5OM5F83L8OJ1J8AS2X8BRC2A7	1979-01-24
50	50	-1327786019	0XGBICMT47	1993-06-14
45	45	-955915642	8	2009-04-21
48	48	-213	1160038N0H804C6O8I4K9P28V	1975-11-03
46	46	-1408819377	6E4Q562114TV9VU57J9I8A	2003-03-25
23	23	6345	660E66J5178Z57374LT9ATTQJW2N2836SU8	1970-03-05
13	13	\N	\N	2013-02-01
19	19	-962075500	1374634WLYZ5482102NDX	1970-02-12
42	42	\N	\N	1990-12-16
14	14	426	ST7582A22BKI7RP323	1979-07-22
20	20	-7654	W032P569TH9A2B65E38074TKXXTUO4243X0CD299OWC26C83Z618VW6827	1987-09-15
49	49	-877091586	PQ3MISUMZJ1E8	2008-09-29
15	15	-1558808606	U8N13EY69	2009-12-21
37	37	\N	\N	2000-12-16
43	43	-1902162011	ZMU900M2I91	2015-06-13
21	21	-402767009	8HW68	1971-05-21
29	29	-1920134656	3LW7E8222A02M5GC50RS6VMA1U39	1971-12-25
38	38	\N	\N	1991-04-15
10	10	-467136845	ZL089T235V0M	1974-08-10
16	16	-5	WHL	1980-08-02
5	5	-72	90	1996-10-05
11	11	\N	\N	1971-03-10
24	24	-303411836	8LX	1970-02-02
30	30	-1682	PX8I98EB7366C	1970-04-03
25	25	-184632593	L	2020-10-24
22	22	-1283383638	976P9126336K2Z163UQO1A011K1	1988-04-19
44	44	-1425374829	D927OU	2016-06-19
6	6	3230	V02D3P	1988-12-20
31	31	0	95SVT3C1F	1973-10-02
39	39	\N	\N	1970-04-06
26	26	-878522082	6B6A0L4	1991-10-25
32	32	-668	R75336Z75NZLB68D7	1970-01-07
17	17	-146259537	E880PHUR85JVTEACK00B9QEJ002NH14M18IA91Z4E	1980-05-16
12	12	\N	\N	1982-03-17
1	1	\N	\N	1970-02-27
34	34	\N	\N	1970-03-20
40	40	-1534756665	1Y1CT0300AH53	1971-08-20
27	27	-526745459	0Z5NX6DZY3ET22T672D	1986-03-11
33	33	951	AG22254P	1986-04-24
7	7	-604240458	Y9378XPH8U6083GYC50YX6	1993-01-28
35	35	\N	\N	2011-09-14
41	41	6	2Z74QS	1979-07-27
36	36	-15215558	J4NA257M582O1H94AGQ8WQL1BCT0Z9	2019-06-03
2	2	\N	\N	1984-05-05
8	8	\N	\N	1986-11-20
3	3	-1080757810	314	1984-05-26
\.


--
-- Data for Name: bsc_r_proyecto_linea; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_r_proyecto_linea (id, bsc_proyecto_id, bsc_linea_id, descripcion, fecha_registro) FROM stdin;
1	46	46	8G4	2002-11-09
2	25	6	72RKWS2S01ID32J5A8L2K	1970-01-01
3	1	32	DS015JY526I292540A0OGIVHMFS5QG32G6W36UE933COH3643Y6365W	2006-09-21
4	27	40	0CVUN26SL7TI	2004-09-06
5	42	20	A	1989-08-26
6	50	30	5RY9817XTG8DI8C	1986-03-15
7	28	47	860K4	2018-09-01
8	16	45	L1QH54Y	1982-09-28
9	31	24	\N	2009-04-22
10	20	40	C2ZQE6J6XV35PK	2012-09-20
11	47	36	2	1998-01-08
12	29	42	\N	1970-01-07
13	7	2	2OWYME7X5K66PYXG3P8POFPBXP2DSX099YA39HX1G4B	1972-02-17
14	5	10	7GH2E2K24C086654ABTX4970TJG1YD	1979-08-08
15	41	31	89V2UC8L6M517B6CFY0	1988-06-17
16	26	20	R	1970-01-09
17	4	28	Q26ZZ9G1TDN49G8H9S739BKCL36003	1986-04-16
18	46	38	NFWFPQ2HUE8H2037V0UIV8ML8K1ZXA48KNI	1995-05-20
19	48	44	1728Z	1970-05-09
20	41	3	97S0PGN1BZ0VBTG95J	1975-10-25
21	8	38	I9ZLZ279	1975-08-29
22	48	44	A683AA23N	2016-05-06
23	7	38	8	1970-01-03
24	1	38	U7VDB824H5J87I	1970-01-04
25	6	13	\N	1999-08-30
26	48	14	\N	2014-12-15
27	30	17	P5TGW9B53	2003-10-12
28	49	28	0W0SR	1970-01-07
29	14	31	187888I1216M858SSU387UT7G177TK7H	1994-09-21
30	25	16	40U1LSU6OVT7L8851L0EUAP6117CMX0C217GLPEL03G5S	2005-11-14
31	6	14	XSX2082	2012-03-26
32	37	27	APXGB91U120ZM5CLWVSXGV82	2016-08-09
33	11	26	I65EAQXWVO9W9FJ0WS8A24W23Z71AD0079D2E3V56H1YD3TW41C738T6T7E	1974-11-14
34	39	32	6CO69DL	1997-08-26
35	11	17	451KL66	1986-02-14
36	35	22	64FIEQ0074YZO9R28315Z4N9U4P3C2S9X398D7ALDTIP8V280520NO1OL3571X2B6TQ23M0U45WW55HT3ML	1985-06-05
37	30	22	47HP5QZ1KF3384	1972-03-27
38	38	6	08AZ156JTDYLD18303ES5IJNJF5UPA8UAY071MW7	2007-01-25
39	1	18	XPF360Y	2009-01-28
40	14	17	27LQ	2019-05-11
41	21	6	ITRN95D0JY9Q56H8BX794638XV4	2015-08-11
42	42	48	9X1P2GY9TE5O53D5	2022-08-09
43	36	35	HM6828	2016-10-30
44	29	42	D7	2020-12-06
45	24	4	1612S12RS73Y448B8	2015-09-18
46	42	14	05H382HQYDI4AZ61E4	1992-04-03
47	8	38	B939G8XL5152T0OU1Y4W8EY9I5C2V6D02DO8	1994-05-30
48	30	9	E5XL79A888WD3KK82G	1992-11-21
49	34	5	8J8P9KPY99QU53IN3751B9J2N2T4K157NAH7	1995-07-24
50	21	35	9F6VQ	1993-06-10
\.


--
-- Data for Name: bsc_r_proyecto_objetivo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_r_proyecto_objetivo (bsc_objetivo_id, bsc_proyecto_id, incluir, fecha_registro) FROM stdin;
47	47	t	1998-05-20
9	9	t	2009-01-28
18	18	f	1980-07-11
4	4	f	1970-06-04
28	28	f	2016-01-27
50	50	t	1993-12-13
45	45	t	2019-08-02
48	48	t	1985-01-11
46	46	t	2005-06-29
23	23	f	2001-09-10
13	13	f	2015-07-19
19	19	t	1999-12-23
42	42	f	1970-01-09
14	14	t	1985-03-28
20	20	f	1974-06-24
49	49	t	1996-03-24
15	15	t	2015-05-17
37	37	t	2001-04-16
43	43	t	1987-06-04
21	21	t	1990-04-20
29	29	f	1998-10-04
38	38	t	1973-11-19
10	10	t	1980-12-29
16	16	f	1970-01-04
5	5	f	2021-11-08
24	24	t	1970-01-10
30	30	f	2020-03-12
25	25	t	2006-02-26
22	22	t	1971-03-13
44	44	f	1970-08-04
6	6	t	2008-11-17
31	31	f	2008-07-04
39	39	t	1993-10-05
26	26	f	1988-08-09
32	32	f	1970-12-30
17	17	t	1992-12-09
12	12	f	1995-12-28
1	1	t	2004-07-13
34	34	t	1976-11-10
40	40	f	1970-04-10
27	27	f	1970-03-16
33	33	t	1995-08-21
7	7	f	1971-10-12
35	35	f	2014-04-04
41	41	t	1986-06-16
36	36	t	1970-01-02
2	2	t	1974-12-01
8	8	t	1990-07-21
3	3	f	1976-10-22
\.


--
-- Data for Name: bsc_r_proyecto_persona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_r_proyecto_persona (bsc_proyecto_id, org_persona_id, fecha_registro) FROM stdin;
47	47	1970-01-08
9	9	1971-09-01
18	18	1970-01-04
4	4	1970-03-18
28	28	1970-02-04
50	50	2014-06-26
45	45	2002-07-24
48	48	1971-08-11
46	46	1986-09-14
23	23	1970-01-29
13	13	1971-06-24
19	19	1976-04-30
42	42	1990-10-30
14	14	1989-12-26
20	20	1996-10-19
49	49	1997-01-12
15	15	1981-12-30
37	37	1970-01-10
43	43	2015-02-10
21	21	2021-09-03
29	29	1974-03-15
38	38	1983-03-24
10	10	2003-06-07
16	16	2000-04-15
5	5	1999-12-21
11	11	1970-03-11
24	24	1970-02-17
30	30	1972-03-13
25	25	2014-03-09
22	22	1996-06-19
44	44	2020-02-03
6	6	1997-03-17
31	31	1970-02-28
39	39	1987-09-30
26	26	1981-08-22
32	32	1970-02-02
17	17	1993-04-07
12	12	1973-04-12
1	1	1974-05-29
34	34	1970-01-07
40	40	1985-12-19
27	27	2003-06-23
33	33	1989-12-23
7	7	2022-10-17
35	35	1987-09-15
41	41	2015-05-11
36	36	2000-07-08
2	2	2014-05-30
8	8	1971-05-06
3	3	2012-07-20
\.


--
-- Data for Name: bsc_r_situacion_departamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_r_situacion_departamento (id, org_departamento_id, est_situacion_id, incluir, fecha_registro) FROM stdin;
1	27	31	f	1975-09-25
2	9	42	f	1992-04-14
3	7	13	t	1993-10-30
4	16	35	t	1994-09-20
5	50	35	t	1992-03-15
6	25	24	t	1986-07-11
7	22	45	t	2013-01-01
8	24	31	t	2019-02-02
9	23	24	f	1973-05-03
10	35	45	f	2013-05-30
11	34	36	f	2017-02-28
12	8	49	f	1995-01-17
13	7	14	t	2023-03-02
14	3	20	f	1997-08-09
15	11	24	t	1970-04-06
16	30	28	t	1989-01-04
17	28	23	t	1973-01-15
18	28	36	f	1970-01-22
19	34	39	t	1988-05-07
20	14	13	t	2021-07-21
21	29	16	f	2022-12-06
22	3	31	t	1983-05-26
23	27	43	f	1975-06-07
24	22	17	t	1970-12-26
25	9	31	f	1983-02-08
26	20	12	f	1973-09-14
27	9	38	f	2018-04-12
28	43	26	t	2019-08-06
29	38	9	f	2011-06-09
30	6	40	t	1992-12-13
31	1	17	t	1971-07-02
32	14	18	f	1970-01-09
33	9	7	t	1986-03-02
34	12	22	t	1993-05-31
35	16	32	f	2008-07-05
36	48	3	t	1970-03-13
37	33	44	f	1988-02-29
38	4	44	f	1985-01-04
39	26	26	t	1970-02-08
40	23	41	f	2004-07-10
41	5	40	t	1994-11-17
42	41	42	t	2004-05-31
43	18	12	f	2008-08-02
44	45	46	t	2008-03-22
45	25	33	f	1970-05-01
46	27	37	f	1995-03-19
47	33	3	f	1989-06-24
48	10	17	f	2008-07-14
49	28	23	t	1970-02-28
50	45	12	t	1978-08-26
\.


--
-- Data for Name: bsc_situacion_departamento_idea_proyecto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_situacion_departamento_idea_proyecto (bsc_r_situacion_departamento_id, bsc_idea_id, bsc_proyecto_id, cantidad_votos, incluir, fecha_registro) FROM stdin;
47	47	47	1	t	1975-09-28
9	9	9	2	f	1997-01-12
18	18	18	3	t	2017-04-28
4	4	4	4	f	2005-02-16
28	28	28	5	t	1989-02-17
50	50	50	6	t	1971-08-21
45	45	45	7	f	1985-10-17
48	48	48	8	f	1970-01-03
46	46	46	9	f	2014-08-10
23	23	23	10	t	1983-07-29
13	13	13	11	f	1970-09-24
19	19	19	12	f	1970-01-05
42	42	42	13	t	2002-01-11
14	14	14	14	f	2011-02-20
20	20	20	15	t	2003-03-29
49	49	49	16	f	2016-04-29
15	15	15	17	t	2007-08-06
37	37	37	18	t	1978-05-16
43	43	43	19	t	2002-04-17
21	21	21	20	f	2015-03-03
29	29	29	21	f	1994-05-05
38	38	38	22	t	1970-01-30
10	10	10	23	f	2002-05-02
16	16	16	24	f	2001-07-11
5	5	5	25	t	2010-08-28
11	11	11	26	t	1999-03-19
24	24	24	27	t	1984-03-25
30	30	30	28	f	1970-01-09
25	25	25	29	t	1989-05-12
22	22	22	30	f	1972-12-05
44	44	44	31	f	1973-02-14
6	6	6	32	f	1990-10-08
31	31	31	33	t	1970-01-02
39	39	39	34	t	1971-04-10
26	26	26	35	f	1985-12-08
32	32	32	36	f	2002-05-06
17	17	17	37	f	1998-07-23
12	12	12	38	f	2011-02-25
1	1	1	39	f	1970-01-06
34	34	34	40	t	1972-01-09
40	40	40	41	t	1970-02-12
27	27	27	42	f	1993-01-17
33	33	33	43	t	1971-10-09
7	7	7	44	t	1987-03-06
35	35	35	45	f	1970-07-17
41	41	41	46	t	1972-12-27
36	36	36	47	t	1971-04-12
2	2	2	48	t	1970-02-18
8	8	8	49	t	2005-10-28
3	3	3	50	t	1978-01-03
\.


--
-- Data for Name: bsc_tema; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_tema (id, bsc_perspectiva_id, nombre, alias, descripcion, orden, fecha_registro) FROM stdin;
1	21	82	G	3G860YWC0W	-1730427394	1972-09-14
2	45	VC9K67WKU	6D6	6J21G2VNUIBP2PERBA6043D	5	1970-01-06
3	2	ULD9N52J79Y4C2X09U62H4	7L2	3	-19	1970-07-14
4	13	4TWOA391C4U4D901X36Q5YT7P7OX3R601G391478E3NB307215	VQQ	3I1SC6Z412K9GBIZI9Z97Z7YRU19W5760Z8	-8	1972-03-25
5	46	M04Z74DSG6Q	BHE9B	SI1V8M	-43911992	1992-05-07
6	3	256IW1K614935E2B0A5H	7L	W7R7R7080	7	1970-01-08
7	28	GCXZAY78ZS7	8P8	PJBT3Q	-1441819014	1975-07-08
8	32	5H1G	D7QD1	R4RQ900C6927B7	-1045682269	2006-12-07
9	16	6S7H52V	7	CE7903JZIW1K54H46G0US1L250U	-1297319231	2011-08-08
10	47	MVV6V1N6J	305A2	1KM27ST5	0	1970-02-16
11	49	NPZ0O44218J064A891KU449Q	IY6MB	98M2YR61K67Q64T84	43	1970-01-05
12	50	2AOL2C7YP7168HNX9VQRN64143Q	I	3MI8HI	-815445597	2000-05-12
13	34	H29D098U2	O	8BGH5TLG6L2FQZW	7	1970-01-08
14	3	58XBO872Q60I23R576946	1TD	\N	-1065496203	1985-10-19
15	16	D44Z	4	9YY6NJNG7039F62VH	-68	1971-11-21
16	32	XXJ9X1940	0XFE	111SHCDX1YQGV385R16M94QFP5	-574991629	1998-08-18
17	41	OS8H4557XO1VHG16Q	69	22739	1	1970-01-02
18	48	1FRAM49RFT7SX58W2TLE2W35G7J708G	SU59I	H2RFVF7RV7SH26WP5IL	-1100922182	1982-09-07
19	7	JPCRQ2240TZP5D0M582A9SP	1	0E8O1661H1J	-1892088825	1975-06-22
20	48	161MMKR41VN30B	1E495	\N	-7	1972-02-27
21	36	E29PJFA3R81Q4M4VCC	2	1	-418820809	1999-09-05
22	16	49YLFY22252SK9H	Z	B3	-74761724	2010-11-11
23	17	OQIDX4F6Q	8TKX7	\N	-149629400	1988-03-24
24	25	6G6F31Z3PP14D5	5	\N	99	1970-01-10
25	39	7JZVEO582LPKB59FLF5548EZ3M597K	4WS73	\N	169	1970-01-17
26	49	9RR7H	B	7YG1NMT	\N	1993-01-08
27	50	570G56M8D2BAP	G	D44I159Y2HZW08G286PJ1S	\N	1970-05-31
28	11	0I8551IVT0	DNI65	MS3764VUD36U1C9V9N3	-1780311758	1970-01-04
29	44	OK0	8G0J	GQAFQ5L	-1	1982-04-21
30	10	194XH0	R4972	129BQSV6EF23E	3	1999-06-01
31	17	NA2X2A337WLQW248C3I	C7X	ZWI9MC9GMRPK5830WB06AT9YS	-1235408561	2012-02-26
32	32	GV98JT9E00853	P	EG2D7257	-2120745080	1983-08-02
33	11	E98EL2791PLP23	3D	FH1W7	-880628574	1997-05-26
34	31	67E77E36B53349V19	BG	81J71P09E1T3CNPPDR4J00XC1	-1948508701	1988-05-07
35	18	MW02HV583	VG	H7	-1814179998	1970-01-02
36	14	R4512I84X2XNIO69LCJS26NGJ3	4	45JT7219LJSJ1P75RB41N71Z924413QB127E5192YB36N042C436SSO	-530035345	1970-01-12
37	20	JK67Y745NMYHU41H1329V2179Q7Q74TAFZ1	57T	N7ZSWL4TSZ809XLNIC40	16	1970-11-29
38	12	B646CLMXK25TOS5B7KA7R719M7	7H26F	\N	1113	2021-09-10
39	23	09V1BGI1U55	5	557LMQ629J169997H	\N	1992-08-01
40	43	OHYMRYF7JB4B0GFF755T9KV7M5QO6P59M5	5	41S711HE2K0A0IMK4D686CO9JO25JK07F56	\N	2003-06-03
41	49	3Q	B	41365190379X963Z74P353GG26AAZLWBD33BH3Y	-33	2019-03-16
42	29	O6279OM42B6I4K3Q6	OFZN1	0WUA65R	-1946845663	1970-01-01
43	43	RV99	0YTMH	\N	\N	2009-10-13
44	31	U13QHD9XG	7C3	48X8OZKO	-1800030228	1970-01-08
45	17	X25YC1X21V1CZ52M3707950X330Z0F884	YV3	J8IK6Q6I56EZ700	\N	1983-05-28
46	24	312F5L9001M5A81HE5	QKDQ4	93HP86H9AL9NHK3JZ212	-1243338462	1971-05-12
47	7	S7GH98E	5A	0G13	-2053497505	1975-02-10
48	26	WUWV7KW0K8Z67I	1	H952Y0ED625609D30A5E651E0V11WEA4V88FB79M7D7	4	2000-08-01
49	50	QH3G34UP1N204EUE4KR1476D35N5M8GZ2M8L22	B8	8VNJUF87OL28L	-1771160391	1970-03-19
50	7	E7959ARB4642V2Z2108COFF84C196A62BNT6N7548G5GNA0Y93	A1	G4WUG	77	2000-05-27
\.


--
-- Data for Name: bsc_tipo_documento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_tipo_documento (id, nombre, alias, descripcion, orden, impuesto, fecha_registro) FROM stdin;
1	85IZ9MP87J7Y5W168SH58Z2KDPQLA55XBQ36S844DVU61F303U	60	H5N62AS72TMQUSP0E4ZLD30JNATVP523OZQ598561	-969236312	-745696	2014-01-02
2	2G7G332YHZ5P1FS4V6C1PEUHCS8F3136NM27U6VIFXAZ3V84NO	088N1	M6	-1254342112	-3133421	1985-06-25
3	NWR4N7O7	E6	71136T80	\N	\N	1997-01-28
4	1B96HM81602	NQX	O40	-1554910793	-7726936	2015-01-18
5	YY44C3A8XD7TG	0L	6	-1563683460	1806440	1980-10-28
6	475AGNLZ6DXS95VTH1	YLLD1	76RT84R36R9PINQ9BN4DC6ETRX05LD	-3953	-3953	1982-10-10
7	0ZGLA09TF2O	0L	18Q93D0YH8GUMB81Z4KSL	\N	\N	2015-07-29
8	89SP	ISPY	1PPLY50S7H61MV5I	-466	-466	2013-07-23
9	4023F037LHU3BV0BDHY270SA36CABN7J2E54Q92B18B45TMG0C	I8D71	N4XC5C34K0KG85GA	-1027030191	-2932858	2014-05-08
10	7K6092O46OD5B6Q2CW5	83	32TCHNL31	-30128269	-7466669	1999-10-05
11	SHNDL5M	R17BD	U799720	-128436595	4358096	1972-06-08
12	0C0	QW	ILG6KQ564977N31XT1O1W460SA82F2I	-1551224379	8518001	1984-08-15
13	1LU	8	2U8W89O27	-575617157	4877846	1976-10-03
14	0GO7EAP0ER35IRC05YHQ5L89084	3BW	TIH85221B252Q1XX589PB287O3YMZA99	-489001348	724408	1971-04-30
15	6H0400G1X7I07DY96KPI6LN49JL12Z9499JW99ECD0JP69JEL5	551JP	Y61	-1391936454	-1300187	2012-08-05
16	7B190J1KJ52T80L	98BZZ	VX06TB52J34LU4M9SW6	-4	-4	2014-08-06
17	71AQQIXL1FPRM5W52S	3	3JBZW4W	-1623289460	6982339	1999-09-24
18	9230M589STK10E56LAT094V09R4F9OADHJF	6F	C116HE3	-1601994760	7796862	1983-01-23
19	A41O4NTDQBR	0	HANZPUHT	-1786918895	-6366311	2020-10-03
20	7I12	Z	808	\N	\N	1983-11-25
21	Y6QS	X	427DL2	-159287926	-2556679	1991-08-01
22	131J43A05R92Q00F46FT21Z530L5J801TFEOOMT22Z9	2	3I4O8F5X71X67C2J2	-1663347861	-8125324	1971-05-19
23	3T5G	14A	7ME	-5076	-5076	1970-11-15
24	04FULZ434Y5XQ59KQ8GUVG5037PE03K	VB	CH2E3C066N9KQ55C0	-1313821302	9228951	1988-10-29
25	M8O3G5VMKX1076	28	GG118O9	-50	-50	1976-07-03
26	R9UX2UF	JTD13	F1762Z10X7	-31	-31	1970-06-02
27	ZU79UV4N56J9PZI86V5R9PK93R5KJ8H6CXAJR42DO5022	5	Z25W679S808KN6R96	\N	\N	1995-09-21
28	U25TL3MY4DQ5AL99Q241IQ5BJ92M6F33K564B	UKBT	04Z9XCKB05VD2F6W50588743SBN	-1512749360	7667820	1978-03-14
29	M2286	7B22	SIG023TQL	-639246310	7287696	1980-12-28
30	PK8058AH38	4YY31	5XD6S30	\N	\N	1970-01-08
31	V31NRX	L	7	-152	-152	1981-09-01
32	OUMJ	5X	413	-778652597	-41124	1981-06-04
33	4L826DPA4F1	32MO	0V01Z7T9854F3666N	-299	-299	2003-12-09
34	I3284XSSA8BHHAD8SJ123	4O	UO	-1701775863	1715443	1976-06-07
35	2G130N	74	4R2QM31M4NI94KOVN7KL2DEB724F74NB06C6A6EEN5U4TUD0CK	76	76	1976-02-01
36	OY4Y81607BZJR2WMC0U6US	65	3F64Q7FOE0AA47ZN	-816496830	7083361	1970-01-08
37	23SE	0A0Z	L4O1NJTP97MLLEJJX	-1841053325	-582079	1971-11-09
38	6O88N72884E0MTZ58TU5C1O4Y4JUAI46Z0153U6YPT53NZ3V04	BI2	FMEF2GNUO82GTU88W7K	-2119337433	4427059	2008-01-30
39	WC760RQX7299XZ356M	L224J	GSCO478FX360O0	-1026080280	2582700	1987-10-25
40	0686B21FY8Z6K520	OV219	NN0F332D1	-438492213	-8039958	1980-08-17
41	E43C50	N	VP9D0MJKD2H3T080A4NNU5298AS6T068	\N	\N	1972-06-01
42	TH	O9	KL9E5H0XT	79	79	1983-09-07
43	3LMDN0	S7	05JE78TJ3BDSW	-6	-6	1990-02-10
44	6CP5OZW	8	0P8S5B12692LA3SV5RO	-646190330	-1841302	1990-11-20
45	J951	OK	42W336UQY2B5B0V2784CB	-1453472836	6041184	1985-09-21
46	L8O2GA	KXWH	58045YSZ5HY4QQ6L5270E4BYYX2L0	-1394058590	-1811031	2022-12-04
47	C57AW	Z0	XDNQ6TZ3UW97HC932TM45N6U4JQ	-8	-8	1997-05-08
48	G3MF5KO8AK73E6B2E26	ZR	5	-1057888460	1049218	1983-07-19
49	D0328C9RQQJ41ZP2374	3	A65OBK007P235Y4ZS21F40EK	\N	\N	2016-03-23
50	P3PNPGTDK	6	9JSJH0	-618048755	-8622406	1970-03-24
\.


--
-- Data for Name: bsc_tipo_objetivo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_tipo_objetivo (id, bsc_tipo_objetivo_id_padre, nivel, nombre, alias, descripcion, orden, fecha_registro) FROM stdin;
1	42	-208045230	0	HB5	XB4T28PU87ZP153	948	1972-01-27
2	40	-519594894	C87Q57R0Q641P81326S70665386M	PLP30	A5DQ1D8QY2B70OG1	-75249806	2017-11-05
3	17	-1380511157	ICULE	519B5	SKQ998XA375LT60I2J9S2IDW428N10S178871345	-3842	1992-11-25
4	4	-1714975763	5E3WX6DC3G53H3UG985S585I08MH3QHPCX824D4JTU950S8UTQ	6K	T9	-5005	2010-07-24
5	33	-1916748248	9UTY319O	2	Z80E91MXRDH56	-822338017	2009-04-21
6	48	-1782497442	XE36X81IXCTH635Z77FSW5Y486	6	W7K14F2	-289212555	2001-02-06
7	44	0	955OC04U0M1	3WA7	8CSSU1C27X22O6	-880787076	1970-01-01
8	19	-925939942	X0TO5RFO9UL1MMM88819	177	W8HZPRVKZXMS2Q9048MV62DDGN3D261OI198	-2087332750	1997-02-08
9	36	-640553115	W6SH27S2K8K3A6E7UZZFAH	7S	KJ7	-645085607	1984-10-13
10	6	-750330294	F18S22P	96JR	5Q6S481	1	1978-07-18
11	1	-1745497363	YX	T	6WJD38LR199U278L112XL	-3	2015-01-27
12	7	-1755933528	C2	L32A2	M6U0D200	-2044202686	2016-04-25
13	41	4528	ZXF5DUE	G75TO	2TN2OKB	-58	1970-02-15
14	49	-868954307	X5	N6	58XP8640PEOT63SKLL4NK1O818IX949V27X1C09Y3SK0NS0P7QZ99L	-56893974	2022-04-14
15	21	-1444141837	61L0EONIEMD406K5P1IU5G52C0B854S86WR	G3K	9YW3IY4P2JUVBYUPXYN0C96YP48C2MVB1M1	-2027539917	1984-06-12
16	29	-1327926227	7SJV8BMZ23839BS1M49K33C5	Z49	45ZOV0R06A95X28JFZ29C95758WD74SYZ6PGEB0C3OJ64LH66AMRM2Z001AC	-2075277969	1981-12-31
17	7	-9	908J	11WL	\N	-990077569	1972-09-08
18	28	-567259918	32D95	\N	\N	\N	2015-11-03
19	15	-1110596919	G82I9P05RA34H18L601HR6M680PNW587	\N	O1	\N	2006-01-15
20	23	-1939458450	48YP8J110CH8ZXS01W17A19	93XQI	3	-617101047	1999-07-14
21	42	-901640776	8269HMDGJ95MN1196D3MXOW	A	LI7YL8A03A	4	2016-02-09
22	27	1	G7YKRM	1	4RH9I4O1D9E	-966899561	1970-01-02
23	9	-12	7S3V87TYPJN15359639FNJ833EKZ4R5YF1IS1SMS003IDUEL6E	\N	I4459CX0LNDP25KLH53F54F	\N	1970-05-08
24	35	-1680077105	3WM0H2FS8948S9	A	HG3E	-90	1979-02-06
25	11	-586294794	SCQ90Q7	2A	2AOB8S2S5TP71F2Q84Z6TFY0284Z21ZS96U454077Y8O4	-718436127	1995-07-21
26	35	-1	7G790ZBHLX88D7379258S2	4SW2C	X	-256875738	1970-06-05
27	47	-1540817631	D0PY5YJ88V3270P673KBM	\N	B5H4H	\N	2020-08-08
28	19	-2085823561	68U45T78F208YU1OP1J4Y419UDU6G0X532DIB8105KO0804O	9	01U5AO9095NOG03438F1	98	1999-09-09
29	34	3607	F4HGXYN70J202	1	N83G9X248D	0	1970-02-06
30	4	-141513076	9OBG013J2APRPGXS	93	KO8G	3	1998-07-01
31	30	-2767	6E	0	7IEE9FL450H	-379624514	1977-07-30
32	27	-46821105	691TFO1	70	PJDBP78U8ZH25141O520MW87KD	-39	1979-11-23
33	7	-613322253	FK906U36KI	D1FNK	VDQ900HMF	3	1973-07-19
34	41	-470322376	9B2LG5Y7NHF76	O7I3U	PK2564BGX5145T7EU	-1060284829	2008-08-08
35	17	158	Q76018KN223J5302ZLIH	8	9GU38V33M41KIAA8QD	-1468223130	1970-01-16
36	36	-2	DWLA24CY76H8A5F	96	\N	-1836830017	1970-09-15
37	13	-3618	9213G0R1ORQP	0LX	MYEXO2629A7627H04AN	0	1979-11-28
38	46	520	K7SL28HW56999M7RSY950123G52A	\N	G54K7LHKZ6NCN01XC4U5SQ8XGK9P4F6O	\N	1970-02-22
39	36	-1816987775	1	UK	OX0YJ7DDG7RFWZMT5E9P8Q89NF864D22948F6735NBHC995WY185871B028958HNY4H4KVF9LY	-1569492360	1971-05-13
40	16	-251034726	B9M1OQ3LE5WPM7V3C2BWA3RFDLQVW1	4	1909	-626237804	1976-05-26
41	3	-2	9F8K2XJGOX7P9100705Z29B	2K4J	C084UXUQW3K69RCWC25	-1433477632	1970-09-04
42	42	-669714775	FEU84B2G	S7	757E3Q	-125	2021-08-31
43	3	-1847073765	WE7N8J21FHDS6WC	6MT87	614909M84744Y	-953	1974-09-12
44	21	-1474573095	87R0	L0	40267Y388	38	1979-05-05
45	18	-1665233497	8G43822MG4Y75KR0	KWE2	I3X2623F51AK98B1YI6B3817ONXU9LEX42	-1432326748	1998-08-31
46	35	-1700684325	8H1L88391151486U7C	A	K12E363205V9055WG10KA3I59YX245Q3O5U46	-1250473806	2012-07-23
47	26	-1573005398	AG78L98S88P3I383	96	H408O9FANT3VEE01Q	-1742124328	2010-08-30
48	24	-1793199360	8TB2982T79G749LK251J8N7M3YX511DPLG0HZOK5	J	MI8O925RXWC49	-18202241	2000-04-03
49	15	-246967084	K4190ZR68W3M55726RBXSN	E1	MHYNBRU546EBM0E404X09Z47DC04FT2JM4BHH4ML0CNBF48D3Y	-115697617	1977-07-02
50	8	-1024309526	21XS8M5M681Y49QZ22FC2IF8O16	83A	MBK0Z	-1304027311	1981-10-03
\.


--
-- Data for Name: bsc_tipo_proyecto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bsc_tipo_proyecto (id, nombre, alias, descripcion, orden, fecha_registro) FROM stdin;
1	X5G8GT3879X	3N4	HVE2T8R23YBJ4XEB2163W	-1594337795	2000-04-18
2	2283	34	KA4R43NCJDCK08P	\N	1980-05-23
3	O1HU6HO	Z7	DJ8WR4ZJ4740Z7Y3CXESR61P557G	-1932331323	2012-01-13
4	M0A2ILPB22BL	4	3G	-1206111521	2009-07-18
5	LRAVPRUM465221H19L89RF28LB3KCTZPHZ51W4B50J1OB9G1I7	VMH	\N	-1866268066	1973-01-26
6	0YT546W524IUH6704D05UED3	4	1M5G9IH57	-1473567969	1992-03-07
7	415K66L476	8	V	-810	2010-11-15
8	41I83H6B37194B1AU7Q366M2AH48E90JZ5WMB2Y0CN93	CC	YFN07	-815959838	1972-02-22
9	F0061543UMBD5M9Y8I5YD	TO	613I	\N	1990-09-19
10	8K16	E	8ZY2	-538807512	2017-03-06
11	6GTNDG4ZQ97UI0	38	\N	-1875553377	2003-02-05
12	8GMQZ28ZX32O220462E	H9KI1	J2Z50AM3R9XFB01Z0886CPH7LTN5QW1DYU	\N	2011-01-05
13	P5	VO	\N	-458763355	1997-12-16
14	VH13XYL73D	\N	2W4T6ZFW3989TSGA632I0FL7T3BB51XKL	-934173911	2005-04-09
15	6T9859QE8BJN03O53	N	1F	\N	1991-04-25
16	8TR	V3377	53KPYU64	-1951601440	2019-02-05
17	0191O6990A6Y	382GP	CI6YA69ZW5F7TG	-2049336419	2006-06-13
18	2IAO	13	54STHU9S8S725T73M1O	-414565123	2016-01-01
19	C6	E	C089A	-778	1994-11-25
20	04EU	Z	RE0W2V6	-1752117249	2019-05-22
21	6CFN39FGEYNG31HTTC4Q2Y3YV7R7X2D0EUBRKK40963J636	E45XV	2S6HE	\N	1970-03-19
22	92BN4S2403X9RQA	G	T3	-2071435585	1971-10-11
23	IO0V9V673C2DDMCSOQVHDYMLNQ8ZOO97LN8KAS2	8293	978GL3LWVD0W8UEDTN763UO417828ID6TU44C69X1RKI9094R9Z8X	-556910584	1970-08-05
24	87W8M1GGOJKYG	K	0E59A609ZZMLMDY3BRT940A34D	-909	1998-08-17
25	CDF93D87UP4IKB0	\N	K53BU2008H	\N	1971-11-16
26	4W4R3578K0E1JB3L4665BJO990823XA90SN401	Z	77853G12R9AICE26DH8S7C9J01FI	-1626035447	2017-09-16
27	7BB4NGEWWF3065H3Q02NUC0VDLSW52FPT0R2H9AW22K414	8B63	U54EQ0KDS27	\N	1970-03-29
28	K4ZL63W1EIPH532V214V0W	0U	27BEQ601H5B26JD8FKVP9LB8ZU	7769	1972-01-28
29	MR0OF4F7A52WQ62RX	7	JMOZEH992QT2V	-64	1989-03-03
30	5006APA8C39BB725	VTCB	B0K78VF9B15S26HJH39A0	-216	2006-09-10
31	1L955R4AKI4QP5FV	N66	\N	-1273948502	1978-05-07
32	7CYFRFM3C96A2A1	2696B	14B	-1159080383	1970-01-03
33	04466M9875003D4S46250N291RQ7T71YO730J0	3F7J0	635TLB6704O	-323661752	1994-07-05
34	3LLN0GQ569S6	AR	YIKXJ7RY74OK4IM3M0CKWL9	8793	2004-11-25
35	B8A1MCBRM3Y981974586MZ7E	4MM9	571Q5BDK3T32790312RI29H4R	-7	2019-07-04
36	AWZIMR9Y6INB052P8E3O0L5V6719CO7S43427X9UF3T9I14U09	9N	2F02XPYSV87169965111H41V	-1132641545	1989-09-12
37	O4UDN5WTU95	I	1170EH2S941G	-194150219	1970-01-05
38	DG2GZMPIPWATD7WHG6L77YWCH32V30	6Z43W	5GUT	-140871145	1975-06-22
39	HKAX0H7I50RRH6SL2I67Q31D6T5	\N	\N	254	1973-03-17
40	55BQB916L83SE49K99XS30N44FM	K84RU	IK53Q277Y107145U	-1551726517	1985-12-20
41	B2627LMP7J0Y4H5F359I95Z19C549X	8M	DS3D00HM5	-834832337	2009-08-06
42	503	2	KL4	-261083417	1997-08-17
43	0T59A3I3EKAIZ607	ZE	W6BN7BE00NDM1R32I0CSO5AV5N	-7194	1982-03-26
44	55Y485027Q	K	3RS3X6V3YUC12C9N5U9SS6BX4V4N2B	46	1979-01-27
45	IQ9N94	R	RG	-199	2015-05-29
46	G60EM583ZH0MT4UX43R765Z82IOBEV2GEW006R5H3RN494886P	9	4H1TD9Q6L591851	-429797563	1993-06-30
47	7EPUK0A19HW22705658A492S495H8CO7E1MEH6	E2	6SI29762Q1KC	-894956562	2002-04-29
48	JKI2O6L8A3IT7FPQ0NEVYESV61W4DV833LEWLSL196PUH87AZY	\N	7	-1801173115	1987-02-07
49	LDP	X09	6W1652P601KWHT7K979QRZ7	-1577559943	1970-03-06
50	T3N	GJ	E15N1I0SVUNQ5X6E7EZ170Z8R9WV2074J932VS418J4FBN45	-592589273	1979-04-10
\.


--
-- Data for Name: col_pdca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.col_pdca (id, nombre, alias, descripcion, orden, fecha_registro) FROM stdin;
1	732	Y69E9	\N	-3	1970-11-15
2	YEW30PSW6H0V46AK3	SJU82	17N4G2WC8CV2DY	-44	1971-03-19
3	ZQ37F8ES8A15R9842C43312P	I7Z	5BUNNZM3OEMN7S36YYTU9GY19WYQSJ2R68OJF4ZKY4C3Q19W5	-2147327915	1976-09-07
4	1ESX6S	7LB	KII9	-99	1972-09-17
5	906HDK366H2	6UDPX	8UM5V9G307NLS0QS199V1	-764789850	2004-07-17
6	12QCTL5F0576VK61IO0P4F8T9	663	99V451WV390O84ER5047DB1RH4TFW5W	-2132297845	1989-07-08
7	N1K8K514G7TB5196Y8Z0919666V	5LI	09D4MCQ91	-1813181518	2005-05-24
8	G1O905R	L59ID	OVO04D	-839866300	1977-07-23
9	E53E78	4	N3M4357A2WMRK8YE03SIF9XDQD5	9791	1970-04-08
10	YA7X65I	SQ	A902V8V550	-1451835693	1980-01-15
11	0D	RZV4	\N	-863310630	1978-01-23
12	9Y93F683786	J90	\N	-898170643	2004-09-01
13	H764ZP1X4T2K33Q56LFC79BR577074PSU9	VKDA2	ZLKW024DV7OM7M	-2072407198	1973-09-05
14	T2LU19BZ3Y3KPMX0R	0MB9S	6	-946498525	2002-01-03
15	3A17S988GPCKXG1AEQ2M75MWKU94UKBT635LO2G7AGDB73XQ0Z	5C	TS5N4KXTTWH33W37L9T9609OLYNIMC838POH0L4OCP7P496G2SY19	7	1970-01-08
16	1QQ4000A8U49BL23RHYNGV2285EYY2R3CQ1715N8L2ODF3XXIZ	7	01CR80M9B9207WYGLY82E8T04SK01975XL1ZZT54V8C7Z110	-1071360178	1977-12-27
17	RSC11O875805Q0Z12T8CWR1U2W1NW5M	WV	39NM0387Y33	-1488001639	1987-11-09
18	D67	0	9Q60O0C56JUM3HUAL	-1526912143	2003-02-21
19	D3Z3H9BJQK20W7TUL4R2LAC776SL6N60BN6U15N2	7HU0S	E4PKE3QZJ21J	1	1970-01-02
20	SDVQ1C	677	I0H	-980070355	1992-12-05
21	5URES3	9	P	-109581212	2014-12-01
22	054VUW1SG4W23JLEMPVY12UN117924OO67HDXAH0TSI66A0QLZ	2	26AE7JOQ	5	1970-01-06
23	4LNV55B2K79UCENYWJ0HRP3TL14U	80	S9	-1722633076	1999-06-14
24	920X0L68H6	MXM	2GZL6N	4623	1970-02-16
25	A	44OBZ	06MGE7	-483258042	2007-03-05
26	7G	OM	Y0	-513540927	2022-06-19
27	SO49Q5UK183R9J332MI996N6967Y	0	QUN1D2C0XFK1833	-62	1971-09-16
28	T102X	0	WL2A0JQ0IPX63010S084	-201272486	1989-07-29
29	83	Y7F79	7R04S7FH44INYTW	-131884464	1995-09-15
30	SG020YS4CP0I63B7MU0HB7U7U540RB51LKO20I9JJZG037B42F	N	\N	-1527340492	2020-04-04
31	KN	8H8X	D066890G81TDQ6118F6723N0U8LLE9	-1539568300	2023-01-25
32	4EBV92	3S361	6D	-1769614602	2003-07-01
33	8872WE6I0YH004O	1J9	2D5EEW	-1267921059	2001-04-21
34	68EW0KM5BD95ETZ	5F	5UR	-1812950189	1989-04-16
35	UWQ4YG	B	98T1CH	-172379019	2012-11-04
36	5A2OZ8H2SFO3B2FQ264FN21NT	24JA9	FJ05P8M0330T	-1420866888	1987-12-11
37	WADEX4B8	51H	R52ST72S18C	-50	1971-05-20
38	W5J498MDRB27	2	\N	-259419434	2005-07-03
39	327	1	5P4LLSN2Q8F506TE3V020CAB	34	1970-01-04
40	XWRQO0EDML2E2A8T8	D	91323J2PQ	-201410630	2007-04-14
41	8Q783173BR8Z8	345Y	MAI5P771H6E3A7Y9PQ3JPP1IE	0	1970-03-13
42	0RC206M5546A675P7J4JNP7P82AQ1	UJ	48B7KT9L23KB	-763653861	2011-04-13
43	9E24748V	N22ZI	Z	-579859532	2014-11-05
44	972	J	2R7	-521565473	2016-07-08
45	UB79624	8	552HO9A14VZ1ZV662168724T3	-413352119	2001-11-07
46	Q9MJI	U	O3Z	\N	2009-09-06
47	0JBKMGJ19FKM0	9	1RA348Y99S56F9O	-339879802	1970-03-12
48	05I	1F	9BHMBM	\N	2013-11-09
49	522P8VBDT4BJTL331HT39418M6N97R40Z5MEW6TH7JX5Y935DN	E0L48	2OVE88Z	\N	1971-04-04
50	O4L2D53M	0WT00	99O6WYUU685AIW6TLPPRJT0Q	7024	1992-04-27
\.


--
-- Data for Name: est_impacto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.est_impacto (id, nombre, alias, fecha_registro) FROM stdin;
1	Bajo	B	1973-03-04
2	Medio	M	1994-01-08
3	Alto 	A	1972-07-15
\.


--
-- Data for Name: est_importancia; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.est_importancia (id, nombre, alias, fecha_registro) FROM stdin;
1	Bajo	B	1999-10-11
2	Medio	M	2000-01-30
3	Alto	A	2015-04-13
\.


--
-- Data for Name: est_modelo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.est_modelo (id, nombre, alias, descripcion, orden, aplica_solo_a_departamentos, fecha_registro) FROM stdin;
\.


--
-- Data for Name: est_situacion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.est_situacion (id, est_submodelo_id, bsc_objetivo_id, est_impacto_id, est_importancia_id, est_urgencia_ud, nombre, alias, descripcion, orden, incluir, fecha_registro, est_urgencia_id) FROM stdin;
1	40	34	3	3	\N	Evaluación de Riesgo Crítico	Riesg	Evaluación para determinar los riesgos que pueden afectar la seguridad operativa	-1874982518	f	2018-08-27	3
2	28	3	2	3	\N	Implementación de Sistema de Soporte	Soprt	Desarrollo de un sistema de soporte a nivel mundial para todas las divisiones	-1611738241	t	2014-03-08	2
3	32	45	3	3	\N	Análisis de Rendimiento	Rendi	Estudio para evaluar el rendimiento de los procesos internos de producción	-450379765	t	2022-09-14	3
4	27	15	1	1	\N	Estrategia de Expansión Internacional	Expan	Planificación de la expansión de la empresa en mercados internacionales clave	8069	f	1970-03-22	1
5	23	17	3	3	\N	Optimización de Recursos	OptRe	Revisión y optimización de los recursos humanos y materiales en operaciones	-547368396	t	2014-01-10	3
6	16	32	3	2	\N	Mejora de Infraestructura	InfrX	Iniciativa para renovar la infraestructura tecnológica y física de las instalaciones	2	f	1970-01-03	2
7	34	37	3	3	\N	Evaluación de Impacto Ambiental	ImpAM	Estudio de los efectos que nuestras operaciones tienen sobre el medio ambiente	-989484501	f	1994-05-04	3
8	29	20	2	1	\N	Desarrollo de Nuevas Aplicaciones	DevAp	Creación y lanzamiento de nuevas aplicaciones móviles para usuarios finales	-1	f	1970-07-16	1
9	36	25	3	3	\N	Auditoría de Seguridad IT	Audit	Revisión exhaustiva de los protocolos y sistemas de seguridad en IT	-119743102	f	1986-12-30	3
10	7	21	2	1	\N	Investigación de Mercado	InveM	Estudio de la demanda y competitividad del producto en varios segmentos	-2066919029	f	1978-10-09	1
11	24	45	3	3	\N	Plan de Ajuste Operacional	Ajust	Revisión y ajuste de las operaciones para alinearse a nuevos estándares	-1180483253	t	1971-02-26	3
12	36	49	3	3	\N	Planificación Estratégica Anual	PlanE	Definición de objetivos anuales para la empresa a nivel corporativo	-712608203	t	2010-09-09	3
13	15	6	1	1	\N	Desarrollo de Talento Interno	DesTa	Programas para la mejora continua del talento humano en la organización	5	f	1970-01-06	1
14	36	15	1	1	\N	Planificación de Nuevas Iniciativas	NueIn	Definición de nuevas iniciativas a implementar en el próximo trimestre	-1403758030	f	1980-04-27	1
15	40	21	3	3	\N	Plan de Transformación Cultural	CultP	Iniciativas para mejorar la cultura organizacional y la comunicación interna	-1611051374	t	1980-03-30	3
16	16	34	3	3	\N	Auditoría de Normas de Calidad	NormC	Revisión de las normas de calidad que afectan a los productos y servicios	291	t	1970-01-30	3
17	7	41	1	1	\N	Mejora de Procesos Administrativos	ProAd	Revisión de los procesos administrativos para aumentar la eficiencia	-15416319	t	1998-11-11	1
18	30	8	3	3	\N	Investigación de Nuevas Tecnologías	NueTe	Evaluación de nuevas tecnologías que puedan ser aplicadas a los procesos operacionales	\N	t	1972-08-02	3
19	43	13	1	1	\N	Ajuste en Estrategia de Marketing	MarAd	Revisión y ajuste de las campañas publicitarias para captar nuevos clientes	-9	f	2003-11-10	1
20	29	34	3	3	\N	Estrategia de Posicionamiento de Marca	PosMa	Definición de la estrategia para mejorar el posicionamiento de marca en el mercado	-1893580586	t	2008-10-24	3
21	41	18	3	3	\N	Revisión de Producto	RevPr	Revisión periódica de la calidad del producto en base a feedback de los clientes	45	t	2021-06-12	2
22	19	29	1	3	\N	Análisis de Competencia	ComAn	Estudio de las fortalezas y debilidades de nuestros principales competidores	-174567892	t	2023-01-16	3
23	17	38	2	2	\N	Reestructuración de Equipos	ResEq	Reestructuración de los equipos operativos para mejorar la eficiencia en el trabajo	-804920132	t	2019-07-25	3
24	26	40	3	3	\N	Evaluación de Proveedores	EvaPr	Evaluación de los proveedores más relevantes en la cadena de suministro	-924759874	f	2015-02-13	3
25	11	9	2	1	\N	Implementación de Sistema de Gestión	SGPro	Desarrollo e implementación de un nuevo sistema para gestionar las operaciones internas	68	f	2020-03-19	1
26	9	33	3	3	\N	Revisión de Políticas de Seguridad	PolSe	Análisis y revisión de las políticas de seguridad internas de la empresa	-334578441	t	2022-11-14	3
27	14	27	1	3	\N	Análisis de Riesgos Legales	RiesL	Evaluación de riesgos legales asociados a nuestras operaciones comerciales	45	t	2018-01-25	1
28	8	23	3	1	\N	Investigación de Patentes	Pate	Análisis de la viabilidad de registrar nuevas patentes relacionadas con la tecnología	-487912314	t	2016-09-03	3
29	22	10	2	3	\N	Estrategia de Desarrollo de Producto	DevPr	Desarrollo de nuevas funcionalidades para nuestros productos más demandados	27	t	2017-04-09	1
30	33	13	3	3	\N	Plan de Mejoras Continuas	MejCo	Definición de objetivos a corto y medio plazo para continuar mejorando nuestros procesos	-109238762	f	2013-06-30	3
31	30	21	3	3	\N	Auditoría Interna Anual	AudAn	Revisión interna de los procesos organizativos para asegurar el cumplimiento de estándares	-875229500	f	2015-11-20	3
32	42	19	1	1	\N	Optimización de Costos	OptCo	Revisión de procesos para reducir los costos operacionales sin comprometer la calidad	-1992834632	f	2024-05-12	1
33	27	34	3	3	\N	Evaluación de Servicios de IT	SerIT	Análisis de los servicios y sistemas tecnológicos empleados en la organización	123	t	2019-02-15	3
34	17	5	2	3	\N	Gestión de Calidad	Calid	Desarrollo de nuevos controles y auditorías para asegurar la calidad de los productos	94	t	2020-08-23	3
35	11	4	3	3	\N	Revisión de Procedimientos Legales	ProcL	Análisis de la normativa legal vigente que afecta las operaciones comerciales	-204905634	f	2011-12-09	3
36	13	50	3	3	\N	Estrategia de Comunicación Interna	ComIn	Desarrollo de nuevas estrategias para mejorar la comunicación interna en la organización	-658213456	t	2022-07-18	3
37	20	9	3	2	\N	Investigación de Nuevos Mercados	NueMe	Análisis de la viabilidad de entrar en nuevos mercados internacionales	-208451232	t	2016-12-11	3
38	15	5	1	1	\N	Capacitación de Personal	Capac	Programas de capacitación para el personal en áreas claves de la organización	13	f	2013-03-02	1
39	25	24	3	3	\N	Optimización de Producción	OptPr	Estudio para mejorar la eficiencia en la línea de producción	-175090983	t	2024-06-05	3
40	22	12	2	1	\N	Mejora de Funcionalidades	FunMe	Optimización de las funcionalidades actuales para mejorar la experiencia del usuario	78	f	2012-10-14	1
41	19	18	3	3	\N	Planificación de Emergencias	EmerP	Preparación de planes de emergencia en caso de fallas críticas de los sistemas	-326798510	f	2020-02-06	3
42	14	37	1	3	\N	Revisión de Seguridad Física	SegFi	Revisión de los protocolos de seguridad física de la infraestructura	-172098923	t	2017-08-29	3
43	28	40	3	3	\N	Revisión de Procesos Productivos	ProPr	Evaluación de los procesos de fabricación para mejorar la eficiencia y reducir desperdicios	29	t	2019-06-12	3
44	30	28	2	1	\N	Análisis de Resultados Financieros	ResFi	Revisión del desempeño financiero de la compañía en los últimos 3 años	-904829160	t	2023-10-15	3
45	19	44	3	3	\N	Control de Calidad Final	ContC	Aseguramiento de que todos los productos cumplan con los estándares de calidad finales	10	f	2020-03-18	3
46	26	22	1	3	\N	Desarrollo de Proveedores	DevPr	Búsqueda y evaluación de nuevos proveedores para la empresa	-490123678	f	2024-05-21	1
47	32	45	3	1	\N	Pruebas de Mercado	PrueM	Estudios de mercado para evaluar el impacto de nuevos productos en el mercado	-284078246	t	2018-07-30	3
48	33	34	3	3	\N	Evaluación de Seguridad Digital	SegDi	Análisis de vulnerabilidades y amenazas en los sistemas digitales de la empresa	-751293402	t	2019-04-22	3
49	21	50	2	1	\N	Renovación de Equipos Tecnológicos	Renov	Evaluación de la necesidad de renovación de equipos y tecnología en la empresa	11	f	2020-05-03	1
50	34	42	3	3	\N	Mejora de Estrategias Comerciales	Estra	Desarrollo de nuevas estrategias para la expansión comercial en nuevos mercados	54	t	2022-12-18	3
\.


--
-- Data for Name: est_submodelo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.est_submodelo (id, est_modelo_id, nombre, alias, descripcion, orden, fecha_registro) FROM stdin;
1	38	IAT9N5I6VHID218S4E6OGQSH1O54651AB7DB9U18I2560UABM9	JI1	5U4619U5833QU5X63IJXS4171F98U895F9LWOQ61W9X6Z6LOP09576R308PU2632G2508138E8EE12UDY41NSRIT2R5Z483733F0D31I8HOI1	-5527	1985-02-18
2	8	S279IY38I6DTK2NS033XG09ZH7ZA9MUNN0L06U23RZ0S3IVAL0	X	FT9TSG047IO7J0QH	\N	1980-07-02
3	39	0QJNP7B0OY8483T1TW	NI2	27U1	-79802405	1994-08-08
4	42	O8G6N12FFB	4P	N7	-898	2000-11-05
5	11	738L09A0D80D307F15UK420989A8A	L	\N	-848718098	1970-01-08
6	27	B1HQ8IEDKF6R69J731N	XV	43S	7	1971-04-25
7	22	K9251A	R	SFIJ6CJ9P	-4	1970-01-08
8	33	78F	P6OJ7	M6U4KTFW0JW6JFR827O110M8BD680526471	73	2017-03-12
9	22	582L6	ID	94Z2B0IRUB2161WWOD7Z	-488817875	2008-05-26
10	39	67JBRTBR54	D1	JR5	-318392655	1972-02-20
11	25	323URPUR5ML692F374V8U26M2ZI0IZD3FK57Z215IBL	B3WM4	6S4C2Y477G94071FW53ME84DSK90XJVOMM795YX25T580LJ1T79JW345HZ9XF381C31E69	-78	1982-05-10
12	25	24O7	21754	D12ICO96JJZ8C9SPH853TYB7JDP80	-1750338239	2007-09-20
13	24	9PA8L61MD1Z129BK093IJ18KK5829JS6	E51Y	KQ	-318916849	1971-04-12
14	2	GQ4	D	O8B9W17H97YB5LDWIG	-46	1987-05-26
15	42	62Y3N2QAS025JN99P7WBML4R9FA2I6ITN88U4	KL	3	\N	1985-02-17
16	24	93F36SMO3	I	65D5YF1DJRSQ338C054KQ04B	-108008466	1990-02-21
17	15	PM4AB40M716948C2N1QSTWDCOBN4PXUWDKL36X8V29Q31MKX51	L	14VYIP0Y430	-2024776123	1982-08-17
18	38	IA	X5	8YD6K1BH43B08ETUY1IG62931K8Y0TM8NM25W702N16LOWBJZEAMGO3FIM8QRP0G59955D8953LT7J860NBAL9087L50498V449VL6	-1854319849	2007-07-09
19	9	60YOXBDKTS87TZGME0PE0X1VHF57O55P7E2P762RA379P1H	1	VU6B28A77ZNY7GCCN16VH2118IF8O	-1780799597	1983-04-11
20	30	2D3A18VT	378	AU705M7236	-1814160802	2010-01-17
21	20	3R8NAJV4O3O	OR	ZK95FP9U0UFDLT	-339907081	1970-01-03
22	39	QQ7XVH43XY9Z0I36TH6FO	N	MXG402T12QC0569V71Q00HH	-427470724	1974-10-10
23	18	4J3IV89O4TMQ37I61QL9L50TR113ZY175DY5S480H4UISP29U1	8	\N	26	1991-08-26
24	22	T07W7K7R1EZ	CUO9Z	N078L4LT5L631Y577IKH47B5	\N	1993-10-08
25	22	5D9V5OW307UXU3V24OO64W9FL486635J60HN964510ITCY55HV	HQ6S2	1K9CQH63H37P7P915Y8P0208QF1Z4P2U30I	-474692517	2013-02-12
26	6	77U15ZR65X5V	CI7PO	9C2V0T7497XET0	-7907	1972-07-09
27	14	0	7M2V	F	-346969851	1984-02-15
28	9	5S1MV2166Z9HBT5JCH50810JRI0YP2A6B6S7530HB9157FJGZ6	5	\N	-587210933	1970-02-27
29	18	H016VR8112F0HIA4	8	QO941VP5N10HRI7TV5C51193994R2S43I598627Z6228EX5FD4GKF6E2KDM9M31K2I2178DPMD8NLC04OAH0SR79NEN3ZR3CGNDS8Z3OAG9O4EMPN3Y36H7313ESJ8H3	-9	1971-04-07
30	33	HANYOW550JC0OQZQ7	J1	L2UCU668590Q20214HD	-889170451	2008-07-31
31	39	4YGOP869FM	J	7WM571ZA7K6G3JVG26PFKEI	571	1986-08-28
32	32	3IS75843	Z	G9XI811FM9K3557P06P373F6Q	-346509402	1986-09-23
33	29	0C2C2E92I57HNCNH58QW5696Q9PZ21C639DXI243	8	E0L0X3U6ZU8SOEB8IPRB6C3R4E6TQNULO0EG1A41053KP036	-1320551699	2006-08-14
34	41	1YR	L	\N	-1100853066	2000-03-10
35	36	QF52IC4IO6OVHSGL8AS143V2N5640	T13	8MX	-45947677	1970-04-15
36	42	1Z8SOP09E42Q5YY8IXZ6ON5	HHM8	G57L9099CXZF	-1584123012	2013-03-03
37	38	29C	N77	V4V7Y0C0K55W838YNQ642	-657693333	1989-06-10
38	34	9A302P5AFMK5VJM4SE5	0	0H0G5GJME125R46LCF5YPF0443N0Z	\N	1971-12-19
39	38	ZTA324238U3AEIY8J60R8NAX4032AQ662W5Q7E7MR99K7541W8	H	\N	\N	1996-04-28
40	13	9W2OI33S8	72	69S1I66RQ4O79F5VBW1G0R914	-1944551653	2013-03-22
41	31	47R5U1I1XVN87U21M3PRETW0	7	O4F3DSJI52SN9OXD	-1991498119	1990-03-25
42	46	BF5	7D03O	4F771ZZM3565W96	-7100	1971-01-26
43	37	WIF0F85	2K	1M8I6WQR4	\N	1994-09-11
44	20	34TH5JAN98IA866Q8W5SOEOSQ3IG7A7R84QL75N5Y798SFQ1F7	25NTG	D0O700F982	-1883912335	1972-07-19
45	26	J32R725GTL9B47S2HYUZWS72L7H26T61D	6L54	24RQ	-443159734	2006-07-28
46	27	9IK786J8NT2DBJ2VH1EDJ0JI3JU09	34V93	C957E9MG0PH6KPI	-248879672	1991-11-04
47	9	297C6QH9	2	7HEA7	\N	1970-01-05
48	17	6R24TN4K6C1M5XQU1	T07	Z3K25P87WX7759S9D	-1740108541	2005-03-11
49	49	TO8X53BNLA8P0CBL9Y602445I0J6QE6M89LNCJ32AJ1QG49O1H	ZN	\N	-39	2022-07-08
50	42	5701EO44U0F184LD6P2UA3F5849535	17YLM	UD	-3844296	1973-11-04
\.


--
-- Data for Name: est_urgencia; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.est_urgencia (id, nombre, alias, fecha_registro) FROM stdin;
1	Bajo	B	1995-03-11
2	Medio	M	2013-07-21
3	Alto	A	2000-01-02
\.


--
-- Data for Name: org_ambito; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.org_ambito (id, org_ambito_id_padre, nivel, nombre, alias, descripcion, orden, fecha_registro) FROM stdin;
1	35	-1530525758	036OE144T89YD0LT71O1762P833G188PQCF0GXR	I	W	-4	1970-12-16
2	4	-613155948	P2D2KF7KU6NB5PAE	1	\N	-193786302	1976-06-26
3	40	-43447281	J	551W	6	-1599307719	2018-06-01
4	47	-11571890	IYK3M11VS119V70W0IMV	M06F2	W	-526896407	1998-10-18
5	14	-1382344305	3273F4Q67J	1	ELLS8556U25D1UG1G3091FQ3E03260C34W3RO	-317040946	2014-07-04
6	27	-1654784855	ZA20Q7I98M	V	T540W07ZGS2WD6	-1273185833	1983-09-19
7	4	-334657116	HS1K873Y96JY85CU3NX55XL6WM541QC8352W68Z05Z4MXHQCXO	3	\N	1	1999-04-11
8	47	-1411645546	KR6TOZUMID55W6897FK	7	88	1	1982-12-18
9	39	-1397855156	513JYCL0C6296BIQ0	L32	7IA33GAM1C3F572CJK2Z9D047FHT5W88	-555388315	2008-01-10
10	20	-1171391329	1Z941MCHC8SQ7657SAA3O23R92H49GM	ED8	J1C55	-2074248717	2001-03-27
11	21	4166	N	2GKD	26N91H01Z2638K	\N	1970-02-11
12	50	-1824398422	JQFJF4AD2	2	8U5HEITQ562UYK90S	848	2022-10-17
13	1	-2118182407	I0O5	E3S0	0W0G4W3Y81	\N	2005-01-06
14	43	-8748	6420TFN	Z05	24C138I3F32O8S0VNO119VV	-887136500	1993-12-14
15	20	-269172954	O395379477F83EL	N	I518P8QV48Z1SXD7EQHV5K66644MZ9GBTVPO161FJK843OX1905	-1202152264	2021-04-06
16	32	-1000917984	7S28Q9756BH2C6ZF849YU	7	NZGD1	14	1976-12-06
17	22	-1842039095	5828M344161UG001T08S1QPJENP	3Q9LG	252434JDWKDHUVC46M570R7H96TVOU43IC5Z5W58D8	-1205517082	1982-10-14
18	46	-1407596532	V	Q	1Q3G6558	-968366740	2003-07-05
19	22	-279216375	N8I3Y13112L31TTE720P6C06K32YW8XZVP4991LL	Q	Y06	-984831710	2005-09-14
20	18	-513648988	G86699	25Y8	4NOKZNDY6L	-828584946	2011-05-04
21	20	2	PU2G8D36C7	9A34	36HTMMHU3UM	-530221242	1970-01-03
22	37	-427437192	QDUVV43BLZ1U4AC	QQ1	VA0NCT0825GUQ7	-1227557543	2003-06-25
23	24	-1009060070	0016347G05	6NO	448L606Q4P4UXA94LC8Y9R694KW1IC3	-1930060553	1987-10-04
24	47	-43	I8X566RO4	5Y	36I7704E0	-687946844	1971-03-15
25	22	-67401246	9I81PB694RF51B2H55K844J0AG6M0N9O23LH9EYHJ0P5B321OO	FL	\N	-4	1998-09-07
26	21	-1055357147	8B5	K	7UIFB8NUJIKK73QR1	-438145499	1970-07-13
27	37	-88	48888P7	M	P	-1904757815	1972-05-31
28	5	190	H4Q62ST0U44XL0G7815F4RN93F1YW9U988HIY	0	Y867LSBAZS64LM9EO389S8Z650ACH1L26NO1LM66UPK	\N	1970-01-02
29	35	-369	0350BD86FD33SMF6281PX3027VNA258	1	5K739J1B77382RG6	-1046008041	1980-02-10
30	48	-887376412	VUJ6727	QSXW	852B2AQ8PHK23F1IE6826H2950HJ61QFI83V59299R4083C84R9606452M6MEE2WM2608STM	-1989758046	1972-05-15
31	43	2	OH5A232HNEL9YOG71838SE06N0DH203KV18Q62L	08	\N	-294523852	1970-01-03
32	24	-545393304	80642CNO92R0P755KB92XL982274	WF92	N10F5T1	-53469614	2015-02-24
33	38	-692045732	23L2CO505JF9JW	680H	8NL8U2838714OAZ8	\N	1993-07-02
34	29	-193301208	7Q9908IOZB	6	97HP5T8VR52OF3LV99HA	-582752613	1980-07-13
35	14	1	621NZ061W2T527LJTWXFUA90U7E22IU4K4322H5SY1HFM2ZL05	1	3GHOKZD3	-1917954521	1970-01-02
36	16	-815582584	41E8J8AJ717K6R29833	0	7H3QU90WU21631	-88	1970-03-12
37	22	-1553445378	BS4P84D8KF81LC002320Z	JVO	86	-1610233964	1972-08-31
38	47	-5531	VB925696V4O6UOUL65	65	\N	\N	1985-02-22
39	48	-799156420	5T3PY14KAR7R61XP457339FFV9PR	9M	26T76M945L5Q68CK7163	-992538428	1989-09-27
40	39	624	80	4	18C26TBG036US8	\N	1970-03-04
41	15	87	7BK2CB3JX8H3365FH67C	4	5D4	\N	1970-01-09
42	32	-1878142455	OSO149I5919T69XINHGX73993W	7A	G9	-1407005434	1975-06-22
43	29	-507724333	3B14YB9C884769B2CERSPI5AY	9	9D706474R2X023F7T	-754	1974-09-28
44	34	-8841	485D2V96Z	2	4Q1503XZM71UA3BLU71	-3292	1994-03-17
45	5	-1742384621	R2028J6Z3E8ZTBVXW85	O0	3001HA1K4LYSCLG5ZNY	-60	2006-03-23
46	33	-984013539	644HMQPUF0MM497A	7	Y2I7M765EKX	\N	1976-04-24
47	14	308	SYJXQJTWC7U0I	UPJ	EKW02	-1746504881	1970-01-31
48	21	-1333064525	44197SGE9I6U1XALRWV1XRV	185	\N	-1986584526	2013-07-14
49	10	-1800546065	R9B8L0305152	88	665CP28F597985Q6C8OKUHX	-1185239469	2010-12-26
50	47	-25653338	88EY55H04SOR9SY023YR65	2	8T4	-891597054	1999-03-09
\.


--
-- Data for Name: org_centro_costo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.org_centro_costo (id, org_centro_costo_id_padre, nivel, nombre, alias, descripcion, orden, fecha_registro) FROM stdin;
1	10	-4178	0MGI99C92R37B88Q3044UC4960H5311I3XVOCQJ506W1	82	M6	-1186068998	1981-06-10
2	50	-873137085	436O0N542448	9XN	J6U42FD9F4CTE	-1762057302	2019-04-18
3	50	-1384566580	2345BJ078O6IX2EN6XX7JN594K71DTL5	4	76L60	26	1979-03-07
4	20	85	Q9QV1G23EB86XE5I645ID06ONXDJJ	1	Z	-1411586052	1970-01-09
5	6	-1198563230	XM866ZEFKK68I64	GCBFJ	\N	1711	1993-04-15
6	41	-831391413	HVH8T62GN243GKS	0YN	V425LU9237ETXGKRQ1961136RJ8CQA9	434	2005-03-12
7	38	5166	I3WMEXGJR09153	F5010	7	-920	1970-02-21
8	3	-1543971571	H3J04UC86558SG1458K24U54	1	I8D	397	1999-12-17
9	5	6341	7U4AI17B9QGR37092D2KFL92JPJPGH6CB887N70Y52SM17272P	78	1	-810410866	1970-03-05
10	45	-3	Y6K9AC2U92	6ZQ	KYE1C9J	-40428704	1970-02-01
11	48	909	L50QG4P2U37CQI0GB8N979NTD469C52I5R4C6S4S7UW87	7S	291F24K77U	-7061	1970-04-01
12	25	-972996762	Q2NYCKR3E5SXY53U44092506PY1I1LU38CIFIX6CC2	0WZ92	F80DBG2VH18IQM2N0ND1B3T7L2DWC28	5706	2016-09-08
13	33	-1404842354	C5	3	WP831EE285IQ6CB7JR1UCWFGY8C97OS4W4ZT04O84	\N	1983-07-15
14	41	-17122160	TLJ4VR07P78Q4JW8R4121N4K045	V7	Q5N8S91J9Z05O7G903NK74Y	-1362385607	2013-03-18
15	8	-1027095872	15F09A07A0W053773SW100EN24DV	O	2P6XED94M517W451Y6K6HYC842	-1722036549	1995-06-01
16	43	2290	C014GZ9G	J6XT	8G1YX8I3T1788JM6Z6Y2GA	5740	1970-01-23
17	38	-1551777635	M52EP1	M	3	-1858601948	2022-11-19
18	34	-9926	HZNW0U	P	5L1401T0UZ4I1	-2055948722	1997-03-06
19	29	-2028217271	094	4	981S3KQ25ZIZH432F6T18O20OT4UH43	-1970502854	2005-12-19
20	5	-867064819	96HK61QEWOV44RQ8LEB0W4LS397DM4UWD50JIF7LIQ3ZG275MX	38	V1M662SVH87NLTT95ZKV8O6G1HZU1H	-229614945	2015-09-22
21	14	-464559939	WWJL99N8724M326V6L17	4	\N	-1553697527	2009-08-25
22	41	5	O1026	1E035	716XP1	-465612593	1970-01-06
23	45	596	ZWO3251	UE	LBXZGVZ6	-911533682	1970-03-01
24	37	-1156943956	0DSM392	4	O3890Y1ALCPG2WDEQ89525813Z9898NEA45G1SP7PVZA64823738JG0Y632DUQ47315P65993TRTI400BC1S557K	-1655598651	1991-06-26
25	4	-353711190	ZY2HP515T0GB56MM1F12I299USTDUC8566O18VCP	XJ	17O98071XU8645451Z73OG56NYXVS5ODD6	-535104168	1995-05-03
26	21	-724256449	E7NAE505LIIR92G1939845ROVVQU8H8H1VYRA2UPT40Q4X776L	Y6	C0XK6J60990L8440CG	-442	1976-02-08
27	14	-687029736	G5YE6UHB6AF6D	R	4MB97740J308O4Q011D	-1504890262	1972-02-27
28	9	-2118358816	S8PI9E2YW	E	\N	-1465564911	1983-08-27
29	30	-1910410424	IMK9	Y	J4UF609BGX2PD9KORG	\N	2018-09-30
30	29	-250277048	GJNRZ9DL	H	Q2K8C991	-2045582524	1994-07-04
31	10	-1801109654	3ZW0398992	G0JY	7169369H8MA28W90S3Z	6	1989-07-30
32	33	8165	KS47H1S6FDQ5C3395NTZ4J7O	P	K	-872568775	1970-03-23
33	11	-382836022	X27UE4MXKQKU	TV	2D1	-1343454029	1985-02-26
34	31	-961329673	7	NI8	\N	-163422094	2007-05-30
35	7	-115	8H84C9	2ZF	R08O	-604152320	1973-03-05
36	47	-85	68M9Q8IQOS18N24K0ZNG79H49VRMUFH0K02	KI8YR	0S6A2YE3YX62NYGPMM1HT50	\N	1972-05-02
37	7	-598	G3VYGMLJN51TDX10CY89D26SNFXR77O433RNFO23Y72I11	CF	N	-1574381837	1986-05-23
38	38	-1358535569	S6B9ZE28H0120398	OR8E	D975WF132MW	-994922378	2021-08-24
39	39	-1596501510	991MZYD1BG3717W2ZWG8D142	OMF	\N	-9479403	1971-09-07
40	21	-995455144	509A	D88	735RL	2	1995-09-25
41	49	58	36NQ	0	WR9L0Q6A11JE48D5414413GRS1YH52024G5Y0FX45	-3140	1970-01-06
42	43	-1357478883	8O67SSY64TPIJG2Z5S7Y4M	T	173	-829987537	2010-10-02
43	17	-1674379369	830B047A42JL26BQ18Q2UL9JR552KR75GJQL22K84GH938	95U0G	12193P47J1AFEMI0BQPG9W	-247802145	2004-06-30
44	40	-84855662	C0454322O72V3H11HF5I	8	2BMN	-1072575366	1977-02-25
45	22	-1226902748	P97KV6AU08H254F745	M9	7732E352I	-694856146	1970-01-01
46	7	46	D7R8SVAP9MW917L9K2I4PJJX60F3646IS2W142	HF0	N30X1NFALR	-222	1970-01-05
47	41	-1653396201	VNFI	9D4	Q9NTQE7G70K89G	535	2001-08-21
48	9	-2061472398	4K83FQ6QZZ4	63E6J	\N	-35	2005-04-18
49	28	-416176493	P6RO1Q	18C7U	4L147E48Z07K90QR6	-112878338	2008-09-18
50	46	-130576136	19	GW	I933N66H37FF	-511474300	1974-01-11
\.


--
-- Data for Name: org_departamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.org_departamento (id, org_departamento_id_padre, nivel, nombre, alias, descripcion, orden, fecha_registro) FROM stdin;
1	3	-1394436159	Departamento de Ventas	DV	Departamento encargado de gestionar las ventas	-913	1998-07-20
2	40	-68	Departamento de Finanzas	DF	\N	-5	1971-11-20
3	14	22	Departamento de Recursos Humanos	DRH	Gestión de personal y recursos humanos	-1396363849	1970-01-03
4	41	-436077930	Departamento de IT	IT	Tecnología y soporte técnico	-1833347014	1984-12-17
5	35	-967637388	Departamento de Marketing	DM	Promoción y estrategias de marketing	-174834225	1973-12-15
6	31	-735836006	Departamento de Investigación y Desarrollo	I+D	\N	\N	1991-09-21
7	21	-53663437	Departamento de Atención al Cliente	DAC	Soporte y atención a los clientes	-1419812086	1994-11-10
8	15	-514351696	Departamento de Logística	DL	Manejo de la cadena de suministro	-1068916444	1972-09-28
9	18	-41887423	Departamento de Compras	DC	\N	55	1971-03-23
10	16	-335040601	Departamento de Producción	DP	Fabricación y gestión de productos	-240182812	1983-10-02
11	48	-1206634539	Departamento de Ventas	DV	Departamento encargado de gestionar las ventas	-913	1998-07-20
12	29	8771	Departamento de Finanzas	DF	\N	0	1970-03-29
13	44	-134	Departamento de Recursos Humanos	DRH	Gestión de personal y recursos humanos	-1396363849	1970-01-03
14	20	-2135373238	Departamento de IT	IT	Tecnología y soporte técnico	-1833347014	1984-04-30
15	12	-2003073836	Departamento de Marketing	DM	Promoción y estrategias de marketing	-28	1973-01-12
16	11	-1379733276	Departamento de Investigación y Desarrollo	I+D	\N	-1251853812	2007-10-28
17	20	-608619035	Departamento de Atención al Cliente	DAC	Soporte y atención a los clientes	\N	2022-06-16
18	10	-1628292713	Departamento de Logística	DL	Manejo de la cadena de suministro	11	2000-07-20
19	40	-869293490	Departamento de Compras	DC	Manejo de adquisiciones de productos y servicios	-1699060175	1995-09-01
20	31	-98	Departamento de Producción	DP	Fabricación y gestión de productos	-1727340850	1972-09-13
21	50	-4	Departamento de Ventas	DV	Departamento encargado de gestionar las ventas	-1832939506	1971-04-12
22	23	28	Departamento de Finanzas	DF	Gestión de recursos financieros	-159020168	1970-01-03
23	19	-1198559295	Departamento de Recursos Humanos	DRH	Gestión de personal y recursos humanos	7	1982-12-24
24	49	-461934059	Departamento de IT	IT	Tecnología y soporte técnico	-1154508268	1988-10-11
25	5	-123	Departamento de Marketing	DM	Promoción y estrategias de marketing	8245	1973-05-21
26	31	-797690541	Departamento de Investigación y Desarrollo	I+D	Desarrollo de nuevos productos y soluciones	-7	1971-12-01
27	9	-1973370921	Departamento de Atención al Cliente	DAC	Soporte y atención a los clientes	-101	1992-11-26
28	11	-18474084	Departamento de Logística	DL	Optimización de la cadena de suministro	78	1979-11-02
29	19	-1245137204	Departamento de Compras	DC	Adquisiciones de equipos y materiales	-3	1970-03-07
30	14	-1853935470	Departamento de Producción	DP	Manejo de la producción de bienes	-618748438	2021-06-04
31	16	76	Departamento de Ventas	DV	Ventas y comercialización de productos	-379746072	1970-01-08
32	26	8	Departamento de Finanzas	DF	Administración de los recursos financieros	-803	1970-01-01
33	30	-1220878540	Departamento de Recursos Humanos	DRH	Gestión de personal y desarrollo organizacional	-4	1976-06-25
34	25	2	Departamento de IT	IT	Soporte técnico y desarrollo de sistemas	-2117970801	1970-01-03
35	50	-1365808799	Departamento de Marketing	DM	Estrategias de marketing digital y tradicional	275	1980-01-16
36	11	-474994060	Departamento de Investigación y Desarrollo	I+D	Innovación tecnológica y nuevos proyectos	-1757805046	1997-07-22
37	37	-910289696	Departamento de Atención al Cliente	DAC	Asistencia y soporte a los clientes	-167	1987-11-29
38	3	-7	Departamento de Logística	DL	Gestión de la distribución de productos	-2138491656	1972-02-06
39	13	-1336849827	Departamento de Compras	DC	Adquisición de bienes y servicios	-550352450	1994-02-25
40	35	-677083369	Departamento de Producción	DP	Producción de bienes y control de calidad	-1827332880	1981-05-04
41	45	-1	Departamento de Ventas	DV	Ventas y comercialización	-4146863	1970-06-04
42	24	-984021490	Departamento de Finanzas	DF	Gestión y control de las finanzas de la empresa	-1590280972	2009-01-10
43	50	-1474886991	Departamento de Recursos Humanos	DRH	Contratación y gestión de personal	-891723981	1981-07-04
44	50	-1899580027	Departamento de IT	IT	Infraestructura y soporte tecnológico	-1946057237	2000-09-08
45	50	-65	Departamento de Marketing	DM	Publicidad y estrategias de marketing	-2028433711	1971-10-18
46	41	-1942594689	Departamento de Investigación y Desarrollo	I+D	Desarrollo de nuevos productos	-465291863	2005-07-25
47	3	-283420938	Departamento de Atención al Cliente	DAC	Atención al cliente y resolución de problemas	-1952835024	1998-07-03
48	22	-1399607177	Departamento de Logística	DL	Planificación y gestión de rutas logísticas	-1489941522	1999-09-13
49	14	-479577770	Departamento de Compras	DC	Gestión de adquisiciones y compras corporativas	3	2021-07-21
50	27	-611980113	Departamento de Producción	DP	Producción y distribución de productos	-1709330909	2021-06-30
\.


--
-- Data for Name: org_persona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.org_persona (id, nombre, alias, descripcion, orden, fecha_registro) FROM stdin;
1	CQ31YMNIO2D305DV5OQ86YF7BCC5YR575DPWGF0BL95HKS7WNW	M	3KP1MOPLSY6	-633245077	2013-05-11
2	7F7BXA98S04T8XY1418P1U3	CA4Y8	U6BXYS	-1969134370	1989-08-12
3	M0795JWD6UU2E2NL	6	574I760J3	-1493332384	2011-08-29
4	C8S	OFGYV	26Z6F0G	-14	1970-05-23
5	K03F0HTRZN7899Y9IW55LPR0Q980B11I61	8N	5UQX0HN64NS378GN	-537211614	1996-01-17
6	712BA9P784S3G1W84G0307KE0JCO160TK3GLS8S	7G	626MMRG4F972U4ABFJ692VZ09UZ74Y	43	1970-01-05
7	W0EQ1OZJ41A2	078	P3W	-951938811	1976-07-29
8	813I4B6U	6G	URS9DYBRGZ4341G	0	1970-01-01
9	3909QSJ6G	19	XXZ304957N4O	-885965027	2000-05-14
10	U8A8I8AY6434G858538645JU308	7YVLE	57RGTYX3ZSI69TSJ6TP0DN109O76OV5107H8E6CX592B1L560D171J1Q	-2084327038	1999-02-10
11	C3289NAW152S86QCG17X7C3MO4WE4NF24X	7A	4Z98Q	-1098138440	1988-01-01
12	OD0XL887Z67546GO9NC2UU85IUD0IEF11240UZ8ZLCN338R8YA	49	P76S	\N	2016-11-25
13	7RJC817G2RW7RT	5MK	GC	-1528462725	2016-06-19
14	JV22X4F43O032	0	25RASS38G4I0335	-978491769	2019-01-12
15	038LW	1A	4Y	-1342091785	1998-08-09
16	JY	LIW5Y	YC	-1518779318	2008-02-29
17	4V9I53UQN1BN1T48CH65E31J8HZ5P5P8S	N	PY8AT44853DY43O9YX7PJ9B9ZN265943HB181804B0B4863O3K96Y6P4I39TS237OZU62	-1442618466	2021-11-27
18	A18	O6	O22AO014IW7	-1514801115	2003-10-14
19	HKYH745	U	583GL2669P0JG77MJ	-1031965864	1997-04-03
20	8I9GG110VP609	1	\N	-1104286870	1970-01-03
21	LN5W7L31DOKYAUE48S138F8GWZG6P	W	7B23KK	26	2008-04-08
22	Z025R	6	IE	\N	1997-02-02
23	63HOJ7B	K	63MIELN2G02DB5870Q4Q9C75SH2V072M2W724I1L	-1683356951	1980-09-28
24	P97YG2OJJ42PO70	QD	5BVTT1F4F1E14137W	-1974774318	1970-03-26
25	S5RA594T0PML4X0I0	P	J1X84GYT160E3S8D190D7TB3VW8F55S160O40GD2711XQC77F	-392	2016-03-30
26	9C	2P6	MM41EZ47V887HF154U907M	8424	1984-11-02
27	T53ZY8X5LJ39F9HR4R1D3TQ2C0	5E	V1IIWI14M2	-1068217243	1981-12-29
28	SL1Q3N5CJ41255675I5L8HN	0G	ZK80	-2140207789	1978-07-20
29	D2	2	6E68XA60	-1927086947	2014-03-22
30	XXK922XXE6WF07L5ALU6HZGH2297GB1K9U766556P8D875OU79	45	741696E9	-278817853	2015-04-26
31	5IM1L6D73U1MIN8I1R487HJB7HO	ND	13	-1812801795	2016-04-20
32	01A131JSIXT83272C65US9	S1	4	-346004422	1970-02-14
33	5WT	FB	03APB5XTUN81B27U2N03IH3245DH87O7B03W14	-742958092	1970-12-22
34	0ZCL80027H8896M99BB24N4Q8F937Q1Y1JH4I2S23	Z9	E003Y66Z2X7H8F2	448	1994-07-06
35	47YDY1K9287IY8U7HEPBQC4	9	\N	-789399391	1970-01-03
36	VI4XD3P33516C22A9SM3N6D74ACG289T096530GXZOMTJDMW	8L	\N	-895	1979-05-31
37	DTV843F301	L	3	2	1970-01-05
38	7KP0F3P058GOS6P42THJI21H1K0	0UF	9QQ5	-1651548750	1986-07-12
39	ZP4531HLZAF50V53M69K0I84	N	0605F5L2UPI2I9XT31JN4	4	1993-07-27
40	H946ETE	RIJ3F	O58	-1189157917	1981-03-18
41	7ARN39M32Y09E5H2678E4LSVWQ9IR	Z7	0O5XV9DQ20L	-1429919717	1970-12-17
42	7748CU7C3YOCHJB38Z3O6H8WXYZBJC	6Z80	31XD87580DX9K72M4QP06338P20H1E8M47V	-1031473520	1970-10-21
43	4TT	D	Z008V9J19UJE9PN22W1E12U222IZRA8B0XBX4JQ21HK03R714LK9O1	-35	1970-01-04
44	9Z34DXE8KA3U4OHQ	54V	QD1H6FP2T3	-2032739475	2002-02-03
45	38KQL2PQ5QU9AKNU1	P	99	35	2018-11-29
46	29VR939V2X33S46	O1ND	Z062	-1899782128	1970-03-07
47	YPC7AKFOZC25TQ5R8ZL	F96H	O	-456178846	1976-01-21
48	7441M51A29Z19	FU	\N	656	2021-12-12
49	P	R	\N	-1327141489	1970-01-10
50	7UWWT20445G13194D0I74I4O45X	Y3647	W8G	\N	1993-05-18
\.


--
-- Data for Name: org_r_persona_cargo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.org_r_persona_cargo (org_cargo_id, org_persona_id, fecha_registro) FROM stdin;
47	47	1970-01-03
9	9	1970-01-05
18	18	2021-01-03
4	4	1975-04-14
28	28	2011-08-01
50	50	2021-03-25
45	45	1970-01-05
48	48	2012-03-03
46	46	1971-11-05
23	23	1970-01-29
13	13	2019-08-16
19	19	1986-11-30
42	42	1999-08-25
14	14	2009-06-28
20	20	1990-07-02
49	49	2022-03-13
15	15	2021-01-07
37	37	1979-06-05
43	43	1993-07-01
21	21	1989-09-02
29	29	1998-07-08
38	38	1970-04-10
10	10	1983-10-08
16	16	1970-01-01
5	5	1970-01-10
11	11	1979-10-18
24	24	1970-01-09
30	30	2014-09-01
25	25	1970-01-01
22	22	2011-03-11
44	44	2012-07-23
6	6	1972-01-16
31	31	1973-08-21
39	39	1970-03-01
26	26	1979-02-14
32	32	1982-04-11
17	17	2007-08-24
12	12	1970-03-12
1	1	1972-06-28
34	34	1972-04-30
40	40	1988-12-29
27	27	1982-05-16
33	33	1976-08-13
7	7	2007-01-16
35	35	1987-06-18
41	41	1979-07-01
36	36	1970-10-14
2	2	1970-12-11
8	8	1974-12-09
3	3	2002-09-15
\.


--
-- Data for Name: org_r_persona_departamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.org_r_persona_departamento (org_departamento_id, org_persona_id, fecha_registro) FROM stdin;
47	47	1993-06-11
9	9	1993-06-26
18	18	2019-01-30
4	4	2009-02-18
28	28	2012-05-30
50	50	2007-03-09
45	45	2015-11-02
48	48	1983-02-03
46	46	1997-07-01
23	23	1971-08-30
13	13	1971-12-15
19	19	1990-01-29
42	42	2015-11-14
14	14	2006-06-20
20	20	1997-10-11
49	49	1978-04-28
15	15	1977-10-30
37	37	2015-03-22
43	43	1970-01-08
21	21	1971-01-23
29	29	2020-09-20
38	38	1970-02-08
10	10	1970-01-04
16	16	2017-04-10
5	5	1996-05-02
11	11	1994-04-09
24	24	1985-04-04
30	30	1994-09-04
25	25	2006-04-28
22	22	1979-08-19
44	44	1970-01-10
6	6	1982-02-26
31	31	1983-06-27
39	39	1970-01-09
26	26	1972-06-17
32	32	1999-09-25
17	17	1970-03-24
12	12	2015-05-18
1	1	1999-06-23
34	34	1970-01-04
40	40	2004-07-02
27	27	1972-07-30
33	33	1974-11-02
7	7	1971-02-07
35	35	1972-09-18
41	41	2020-04-28
36	36	1998-06-10
2	2	2005-05-27
8	8	2011-07-03
3	3	1970-01-07
\.


--
-- Name: bsc_ideas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_ideas_id_seq', 1, false);


--
-- Name: bsc_inventario_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_inventario_item_id_seq', 1, false);


--
-- Name: bsc_inventario_unidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_inventario_unidad_id_seq', 1, false);


--
-- Name: bsc_kpi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_kpi_id_seq', 1, false);


--
-- Name: bsc_kpi_meta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_kpi_meta_id_seq', 1, false);


--
-- Name: bsc_linea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_linea_id_seq', 1, false);


--
-- Name: bsc_lugar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_lugar_id_seq', 1, false);


--
-- Name: bsc_objetivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_objetivo_id_seq', 1, false);


--
-- Name: bsc_perspectiva_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_perspectiva_id_seq', 1, false);


--
-- Name: bsc_plan_de_cuentas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_plan_de_cuentas_id_seq', 1, false);


--
-- Name: bsc_proceso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_proceso_id_seq', 1, false);


--
-- Name: bsc_proveedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_proveedor_id_seq', 1, false);


--
-- Name: bsc_proyecto_actividad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_proyecto_actividad_id_seq', 1, false);


--
-- Name: bsc_proyecto_actividad_tipoactividad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_proyecto_actividad_tipoactividad_id_seq', 1, false);


--
-- Name: bsc_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_proyecto_id_seq', 1, false);


--
-- Name: bsc_proyecto_inventario_recursos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_proyecto_inventario_recursos_id_seq', 1, false);


--
-- Name: bsc_proyecto_objetivo_especifico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_proyecto_objetivo_especifico_id_seq', 1, false);


--
-- Name: bsc_proyecto_pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_proyecto_pedido_id_seq', 1, false);


--
-- Name: bsc_r_proyecto_linea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_r_proyecto_linea_id_seq', 1, false);


--
-- Name: bsc_r_situacion_departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_r_situacion_departamento_id_seq', 1, false);


--
-- Name: bsc_tema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_tema_id_seq', 1, false);


--
-- Name: bsc_tipo_documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_tipo_documento_id_seq', 1, false);


--
-- Name: bsc_tipo_objetivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_tipo_objetivo_id_seq', 1, false);


--
-- Name: bsc_tipo_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bsc_tipo_proyecto_id_seq', 1, false);


--
-- Name: col_pdca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.col_pdca_id_seq', 1, false);


--
-- Name: est_impacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.est_impacto_id_seq', 1, false);


--
-- Name: est_importancia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.est_importancia_id_seq', 1, false);


--
-- Name: est_modelo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.est_modelo_id_seq', 1, false);


--
-- Name: est_situacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.est_situacion_id_seq', 1, false);


--
-- Name: est_submodelo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.est_submodelo_id_seq', 1, false);


--
-- Name: est_urgencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.est_urgencia_id_seq', 1, false);


--
-- Name: org_ambito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.org_ambito_id_seq', 1, false);


--
-- Name: org_centro_costo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.org_centro_costo_id_seq', 1, false);


--
-- Name: org_departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.org_departamento_id_seq', 1, false);


--
-- Name: org_persona_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.org_persona_id_seq', 1, false);


--
-- Name: bsc_ideas bsc_ideas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_ideas
    ADD CONSTRAINT bsc_ideas_pkey PRIMARY KEY (id);


--
-- Name: bsc_inventario_item bsc_inventario_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_inventario_item
    ADD CONSTRAINT bsc_inventario_item_pkey PRIMARY KEY (id);


--
-- Name: bsc_inventario_unidad bsc_inventario_unidad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_inventario_unidad
    ADD CONSTRAINT bsc_inventario_unidad_pkey PRIMARY KEY (id);


--
-- Name: bsc_kpi_meta bsc_kpi_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_kpi_meta
    ADD CONSTRAINT bsc_kpi_meta_pkey PRIMARY KEY (id);


--
-- Name: bsc_kpi bsc_kpi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_kpi
    ADD CONSTRAINT bsc_kpi_pkey PRIMARY KEY (id);


--
-- Name: bsc_linea bsc_linea_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_linea
    ADD CONSTRAINT bsc_linea_pkey PRIMARY KEY (id);


--
-- Name: bsc_lugar bsc_lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_lugar
    ADD CONSTRAINT bsc_lugar_pkey PRIMARY KEY (id);


--
-- Name: bsc_objetivo bsc_objetivo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_objetivo
    ADD CONSTRAINT bsc_objetivo_pkey PRIMARY KEY (id);


--
-- Name: bsc_perspectiva bsc_perspectiva_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_perspectiva
    ADD CONSTRAINT bsc_perspectiva_pkey PRIMARY KEY (id);


--
-- Name: bsc_plan_de_cuentas bsc_plan_de_cuentas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_plan_de_cuentas
    ADD CONSTRAINT bsc_plan_de_cuentas_pkey PRIMARY KEY (id);


--
-- Name: bsc_proceso bsc_proceso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proceso
    ADD CONSTRAINT bsc_proceso_pkey PRIMARY KEY (id);


--
-- Name: bsc_proveedor bsc_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proveedor
    ADD CONSTRAINT bsc_proveedor_pkey PRIMARY KEY (id);


--
-- Name: bsc_proyecto_actividad bsc_proyecto_actividad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_actividad
    ADD CONSTRAINT bsc_proyecto_actividad_pkey PRIMARY KEY (id);


--
-- Name: bsc_proyecto_actividad_tipoactividad bsc_proyecto_actividad_tipoactividad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_actividad_tipoactividad
    ADD CONSTRAINT bsc_proyecto_actividad_tipoactividad_pkey PRIMARY KEY (id);


--
-- Name: bsc_proyecto_inventario_recursos bsc_proyecto_inventario_recursos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_inventario_recursos
    ADD CONSTRAINT bsc_proyecto_inventario_recursos_pkey PRIMARY KEY (id);


--
-- Name: bsc_proyecto_objetivo_especifico bsc_proyecto_objetivo_especifico_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_objetivo_especifico
    ADD CONSTRAINT bsc_proyecto_objetivo_especifico_pkey PRIMARY KEY (id);


--
-- Name: bsc_proyecto_pedido bsc_proyecto_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_pedido
    ADD CONSTRAINT bsc_proyecto_pedido_pkey PRIMARY KEY (id);


--
-- Name: bsc_proyecto bsc_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto
    ADD CONSTRAINT bsc_proyecto_pkey PRIMARY KEY (id);


--
-- Name: bsc_r_objetivo_departamento bsc_r_objetivo_departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_objetivo_departamento
    ADD CONSTRAINT bsc_r_objetivo_departamento_pkey PRIMARY KEY (bsc_objetivo_id, org_departamento_id);


--
-- Name: bsc_r_plan_de_cuentas_departamento_presupuesto bsc_r_plan_de_cuentas_departamento_presupuesto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_plan_de_cuentas_departamento_presupuesto
    ADD CONSTRAINT bsc_r_plan_de_cuentas_departamento_presupuesto_pkey PRIMARY KEY (bsc_plan_de_cuentas_id, org_departamento_id);


--
-- Name: bsc_r_proyecto_linea bsc_r_proyecto_linea_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_proyecto_linea
    ADD CONSTRAINT bsc_r_proyecto_linea_pkey PRIMARY KEY (id);


--
-- Name: bsc_r_proyecto_objetivo bsc_r_proyecto_objetivo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_proyecto_objetivo
    ADD CONSTRAINT bsc_r_proyecto_objetivo_pkey PRIMARY KEY (bsc_objetivo_id, bsc_proyecto_id);


--
-- Name: bsc_r_proyecto_persona bsc_r_proyecto_persona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_proyecto_persona
    ADD CONSTRAINT bsc_r_proyecto_persona_pkey PRIMARY KEY (bsc_proyecto_id, org_persona_id);


--
-- Name: bsc_r_situacion_departamento bsc_r_situacion_departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_situacion_departamento
    ADD CONSTRAINT bsc_r_situacion_departamento_pkey PRIMARY KEY (id);


--
-- Name: bsc_tema bsc_tema_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_tema
    ADD CONSTRAINT bsc_tema_pkey PRIMARY KEY (id);


--
-- Name: bsc_tipo_documento bsc_tipo_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_tipo_documento
    ADD CONSTRAINT bsc_tipo_documento_pkey PRIMARY KEY (id);


--
-- Name: bsc_tipo_objetivo bsc_tipo_objetivo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_tipo_objetivo
    ADD CONSTRAINT bsc_tipo_objetivo_pkey PRIMARY KEY (id);


--
-- Name: bsc_tipo_proyecto bsc_tipo_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_tipo_proyecto
    ADD CONSTRAINT bsc_tipo_proyecto_pkey PRIMARY KEY (id);


--
-- Name: col_pdca col_pdca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.col_pdca
    ADD CONSTRAINT col_pdca_pkey PRIMARY KEY (id);


--
-- Name: est_impacto est_impacto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_impacto
    ADD CONSTRAINT est_impacto_pkey PRIMARY KEY (id);


--
-- Name: est_importancia est_importancia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_importancia
    ADD CONSTRAINT est_importancia_pkey PRIMARY KEY (id);


--
-- Name: est_modelo est_modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_modelo
    ADD CONSTRAINT est_modelo_pkey PRIMARY KEY (id);


--
-- Name: est_situacion est_situacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_situacion
    ADD CONSTRAINT est_situacion_pkey PRIMARY KEY (id);


--
-- Name: est_submodelo est_submodelo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_submodelo
    ADD CONSTRAINT est_submodelo_pkey PRIMARY KEY (id);


--
-- Name: est_urgencia est_urgencia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_urgencia
    ADD CONSTRAINT est_urgencia_pkey PRIMARY KEY (id);


--
-- Name: org_ambito org_ambito_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_ambito
    ADD CONSTRAINT org_ambito_pkey PRIMARY KEY (id);


--
-- Name: org_centro_costo org_centro_costo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_centro_costo
    ADD CONSTRAINT org_centro_costo_pkey PRIMARY KEY (id);


--
-- Name: org_departamento org_departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_departamento
    ADD CONSTRAINT org_departamento_pkey PRIMARY KEY (id);


--
-- Name: org_persona org_persona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_persona
    ADD CONSTRAINT org_persona_pkey PRIMARY KEY (id);


--
-- Name: bsc_proyecto_actividad bsc_proyecto_actividad_bsc_lugar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_actividad
    ADD CONSTRAINT bsc_proyecto_actividad_bsc_lugar_id_fkey FOREIGN KEY (bsc_lugar_id) REFERENCES public.bsc_lugar(id);


--
-- Name: bsc_proyecto_actividad bsc_proyecto_actividad_bsc_proyecto_actividad_tipoactivida_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_actividad
    ADD CONSTRAINT bsc_proyecto_actividad_bsc_proyecto_actividad_tipoactivida_fkey FOREIGN KEY (bsc_proyecto_actividad_tipoactividad_id) REFERENCES public.bsc_proyecto_actividad_tipoactividad(id);


--
-- Name: bsc_proyecto_actividad bsc_proyecto_actividad_bsc_proyecto_objetivo_especifico_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_actividad
    ADD CONSTRAINT bsc_proyecto_actividad_bsc_proyecto_objetivo_especifico_id_fkey FOREIGN KEY (bsc_proyecto_objetivo_especifico_id) REFERENCES public.bsc_proyecto_objetivo_especifico(id);


--
-- Name: bsc_proyecto_actividad bsc_proyecto_actividad_col_pdca_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_actividad
    ADD CONSTRAINT bsc_proyecto_actividad_col_pdca_id_fkey FOREIGN KEY (col_pdca_id) REFERENCES public.col_pdca(id);


--
-- Name: bsc_proyecto_actividad bsc_proyecto_actividad_org_ambito_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_actividad
    ADD CONSTRAINT bsc_proyecto_actividad_org_ambito_id_fkey FOREIGN KEY (org_ambito_id) REFERENCES public.org_ambito(id);


--
-- Name: bsc_proyecto_actividad bsc_proyecto_actividad_org_centro_costo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_actividad
    ADD CONSTRAINT bsc_proyecto_actividad_org_centro_costo_id_fkey FOREIGN KEY (org_centro_costo_id) REFERENCES public.org_centro_costo(id);


--
-- Name: bsc_proyecto_actividad bsc_proyecto_actividad_org_persona_id_registrador_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_actividad
    ADD CONSTRAINT bsc_proyecto_actividad_org_persona_id_registrador_por_fkey FOREIGN KEY (org_persona_id_registrador_por) REFERENCES public.org_persona(id);


--
-- Name: bsc_proyecto_actividad bsc_proyecto_actividad_org_persona_id_responsable_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_actividad
    ADD CONSTRAINT bsc_proyecto_actividad_org_persona_id_responsable_fkey FOREIGN KEY (org_persona_id_responsable) REFERENCES public.org_persona(id);


--
-- Name: bsc_proyecto_inventario_recursos bsc_proyecto_inventario_recur_bsc_proyecto_inventario_item_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_inventario_recursos
    ADD CONSTRAINT bsc_proyecto_inventario_recur_bsc_proyecto_inventario_item_fkey FOREIGN KEY (bsc_proyecto_inventario_item_id) REFERENCES public.bsc_inventario_item(id);


--
-- Name: bsc_proyecto_inventario_recursos bsc_proyecto_inventario_recur_bsc_proyecto_inventario_pedi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_inventario_recursos
    ADD CONSTRAINT bsc_proyecto_inventario_recur_bsc_proyecto_inventario_pedi_fkey FOREIGN KEY (bsc_proyecto_inventario_pedido_id) REFERENCES public.bsc_proyecto_pedido(id);


--
-- Name: bsc_proyecto_pedido bsc_proyecto_pedido_bsc_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_pedido
    ADD CONSTRAINT bsc_proyecto_pedido_bsc_proveedor_id_fkey FOREIGN KEY (bsc_proveedor_id) REFERENCES public.bsc_proveedor(id);


--
-- Name: bsc_proyecto_pedido bsc_proyecto_pedido_bsc_proyecto_actividad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_pedido
    ADD CONSTRAINT bsc_proyecto_pedido_bsc_proyecto_actividad_id_fkey FOREIGN KEY (bsc_proyecto_actividad_id) REFERENCES public.bsc_proyecto_actividad(id);


--
-- Name: bsc_proyecto_pedido bsc_proyecto_pedido_bsc_tipo_documento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_pedido
    ADD CONSTRAINT bsc_proyecto_pedido_bsc_tipo_documento_id_fkey FOREIGN KEY (bsc_tipo_documento_id) REFERENCES public.bsc_tipo_documento(id);


--
-- Name: bsc_proyecto_pedido bsc_proyecto_pedido_org_persona_id_solicitante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_pedido
    ADD CONSTRAINT bsc_proyecto_pedido_org_persona_id_solicitante_fkey FOREIGN KEY (org_persona_id_solicitante) REFERENCES public.org_persona(id);


--
-- Name: bsc_r_objetivo_departamento bsc_r_objetivo_departamento_bsc_objetivo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_objetivo_departamento
    ADD CONSTRAINT bsc_r_objetivo_departamento_bsc_objetivo_id_fkey FOREIGN KEY (bsc_objetivo_id) REFERENCES public.bsc_objetivo(id);


--
-- Name: bsc_r_objetivo_departamento bsc_r_objetivo_departamento_org_departamento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_objetivo_departamento
    ADD CONSTRAINT bsc_r_objetivo_departamento_org_departamento_id_fkey FOREIGN KEY (org_departamento_id) REFERENCES public.org_departamento(id);


--
-- Name: bsc_r_plan_de_cuentas_departamento_presupuesto bsc_r_plan_de_cuentas_departamento__bsc_plan_de_cuentas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_plan_de_cuentas_departamento_presupuesto
    ADD CONSTRAINT bsc_r_plan_de_cuentas_departamento__bsc_plan_de_cuentas_id_fkey FOREIGN KEY (bsc_plan_de_cuentas_id) REFERENCES public.bsc_plan_de_cuentas(id);


--
-- Name: bsc_r_plan_de_cuentas_departamento_presupuesto bsc_r_plan_de_cuentas_departamento_pre_org_departamento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_plan_de_cuentas_departamento_presupuesto
    ADD CONSTRAINT bsc_r_plan_de_cuentas_departamento_pre_org_departamento_id_fkey FOREIGN KEY (org_departamento_id) REFERENCES public.org_departamento(id);


--
-- Name: bsc_r_proyecto_objetivo bsc_r_proyecto_objetivo_bsc_objetivo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_proyecto_objetivo
    ADD CONSTRAINT bsc_r_proyecto_objetivo_bsc_objetivo_id_fkey FOREIGN KEY (bsc_objetivo_id) REFERENCES public.bsc_objetivo(id);


--
-- Name: bsc_r_proyecto_objetivo bsc_r_proyecto_objetivo_bsc_proyecto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_proyecto_objetivo
    ADD CONSTRAINT bsc_r_proyecto_objetivo_bsc_proyecto_id_fkey FOREIGN KEY (bsc_proyecto_id) REFERENCES public.bsc_proyecto(id);


--
-- Name: bsc_r_proyecto_persona bsc_r_proyecto_persona_bsc_proyecto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_proyecto_persona
    ADD CONSTRAINT bsc_r_proyecto_persona_bsc_proyecto_id_fkey FOREIGN KEY (bsc_proyecto_id) REFERENCES public.bsc_proyecto(id);


--
-- Name: bsc_r_proyecto_persona bsc_r_proyecto_persona_org_persona_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_proyecto_persona
    ADD CONSTRAINT bsc_r_proyecto_persona_org_persona_id_fkey FOREIGN KEY (org_persona_id) REFERENCES public.org_persona(id);


--
-- Name: bsc_inventario_item fk_bsc_inventario_unidad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_inventario_item
    ADD CONSTRAINT fk_bsc_inventario_unidad FOREIGN KEY (bsc_inventario_unidad_id) REFERENCES public.bsc_inventario_unidad(id);


--
-- Name: bsc_kpi_meta fk_bsc_kpi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_kpi_meta
    ADD CONSTRAINT fk_bsc_kpi FOREIGN KEY (bsc_kpi_id) REFERENCES public.bsc_kpi(id);


--
-- Name: bsc_r_proyecto_linea fk_bsc_linea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_proyecto_linea
    ADD CONSTRAINT fk_bsc_linea FOREIGN KEY (bsc_linea_id) REFERENCES public.bsc_linea(id);


--
-- Name: bsc_lugar fk_bsc_lugar_padre; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_lugar
    ADD CONSTRAINT fk_bsc_lugar_padre FOREIGN KEY (bsc_lugar_id_padre) REFERENCES public.bsc_lugar(id);


--
-- Name: bsc_kpi fk_bsc_objetivo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_kpi
    ADD CONSTRAINT fk_bsc_objetivo FOREIGN KEY (bsc_objetivo_id) REFERENCES public.bsc_objetivo(id);


--
-- Name: bsc_tema fk_bsc_perspectiva; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_tema
    ADD CONSTRAINT fk_bsc_perspectiva FOREIGN KEY (bsc_perspectiva_id) REFERENCES public.bsc_perspectiva(id);


--
-- Name: bsc_inventario_item fk_bsc_plan_de_cuentas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_inventario_item
    ADD CONSTRAINT fk_bsc_plan_de_cuentas FOREIGN KEY (bsc_plan_de_cuentas_id) REFERENCES public.bsc_plan_de_cuentas(id);


--
-- Name: bsc_plan_de_cuentas fk_bsc_plan_de_cuentas_padre; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_plan_de_cuentas
    ADD CONSTRAINT fk_bsc_plan_de_cuentas_padre FOREIGN KEY (bsc_plan_de_cuentas_id_padre) REFERENCES public.bsc_plan_de_cuentas(id);


--
-- Name: bsc_proyecto fk_bsc_proceso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto
    ADD CONSTRAINT fk_bsc_proceso FOREIGN KEY (bsc_proceso_id) REFERENCES public.bsc_proceso(id);


--
-- Name: bsc_proceso fk_bsc_proceso_padre; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proceso
    ADD CONSTRAINT fk_bsc_proceso_padre FOREIGN KEY (bsc_proceso_id_padre) REFERENCES public.bsc_proceso(id);


--
-- Name: bsc_inventario_item fk_bsc_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_inventario_item
    ADD CONSTRAINT fk_bsc_proveedor FOREIGN KEY (bsc_proveedor_id) REFERENCES public.bsc_proveedor(id);


--
-- Name: bsc_kpi fk_bsc_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_kpi
    ADD CONSTRAINT fk_bsc_proyecto FOREIGN KEY (bsc_proyecto_id) REFERENCES public.bsc_proyecto(id);


--
-- Name: bsc_r_proyecto_linea fk_bsc_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_proyecto_linea
    ADD CONSTRAINT fk_bsc_proyecto FOREIGN KEY (bsc_proyecto_id) REFERENCES public.bsc_proyecto(id);


--
-- Name: bsc_proyecto_actividad_tipoactividad fk_bsc_proyecto_actividad_tipoactividad_padre; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_actividad_tipoactividad
    ADD CONSTRAINT fk_bsc_proyecto_actividad_tipoactividad_padre FOREIGN KEY (bsc_proyecto_actividad_tipoactividad_id_padre) REFERENCES public.bsc_proyecto_actividad_tipoactividad(id);


--
-- Name: bsc_proyecto_objetivo_especifico fk_bsc_r_proyecto_linea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto_objetivo_especifico
    ADD CONSTRAINT fk_bsc_r_proyecto_linea FOREIGN KEY (bsc_r_proyecto_linea_id) REFERENCES public.bsc_r_proyecto_linea(id);


--
-- Name: bsc_r_situacion_departamento fk_bsc_r_situacion_departamento_est_situacion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_situacion_departamento
    ADD CONSTRAINT fk_bsc_r_situacion_departamento_est_situacion FOREIGN KEY (est_situacion_id) REFERENCES public.est_situacion(id);


--
-- Name: bsc_r_situacion_departamento fk_bsc_r_situacion_departamento_org_departamento; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_r_situacion_departamento
    ADD CONSTRAINT fk_bsc_r_situacion_departamento_org_departamento FOREIGN KEY (org_departamento_id) REFERENCES public.org_departamento(id);


--
-- Name: bsc_objetivo fk_bsc_tema; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_objetivo
    ADD CONSTRAINT fk_bsc_tema FOREIGN KEY (bsc_tema_id) REFERENCES public.bsc_tema(id);


--
-- Name: bsc_objetivo fk_bsc_tipo_objetivo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_objetivo
    ADD CONSTRAINT fk_bsc_tipo_objetivo FOREIGN KEY (bsc_tipo_objetivo_id) REFERENCES public.bsc_tipo_objetivo(id);


--
-- Name: bsc_tipo_objetivo fk_bsc_tipo_objetivo_padre; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_tipo_objetivo
    ADD CONSTRAINT fk_bsc_tipo_objetivo_padre FOREIGN KEY (bsc_tipo_objetivo_id_padre) REFERENCES public.bsc_tipo_objetivo(id);


--
-- Name: bsc_proyecto fk_bsc_tipo_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto
    ADD CONSTRAINT fk_bsc_tipo_proyecto FOREIGN KEY (bsc_tipo_proyecto_id) REFERENCES public.bsc_tipo_proyecto(id);


--
-- Name: est_situacion fk_est_situacion_bsc_objetivo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_situacion
    ADD CONSTRAINT fk_est_situacion_bsc_objetivo FOREIGN KEY (bsc_objetivo_id) REFERENCES public.bsc_objetivo(id);


--
-- Name: est_situacion fk_est_situacion_est_impacto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_situacion
    ADD CONSTRAINT fk_est_situacion_est_impacto FOREIGN KEY (est_impacto_id) REFERENCES public.est_impacto(id);


--
-- Name: est_situacion fk_est_situacion_est_importancia; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_situacion
    ADD CONSTRAINT fk_est_situacion_est_importancia FOREIGN KEY (est_importancia_id) REFERENCES public.est_importancia(id);


--
-- Name: est_situacion fk_est_situacion_est_submodelo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_situacion
    ADD CONSTRAINT fk_est_situacion_est_submodelo FOREIGN KEY (est_submodelo_id) REFERENCES public.est_submodelo(id);


--
-- Name: est_situacion fk_est_situacion_est_urgencia; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.est_situacion
    ADD CONSTRAINT fk_est_situacion_est_urgencia FOREIGN KEY (est_urgencia_ud) REFERENCES public.est_urgencia(id);


--
-- Name: org_ambito fk_org_ambito_padre; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_ambito
    ADD CONSTRAINT fk_org_ambito_padre FOREIGN KEY (org_ambito_id_padre) REFERENCES public.org_ambito(id);


--
-- Name: org_centro_costo fk_org_centro_costo_padre; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_centro_costo
    ADD CONSTRAINT fk_org_centro_costo_padre FOREIGN KEY (org_centro_costo_id_padre) REFERENCES public.org_centro_costo(id);


--
-- Name: bsc_objetivo fk_org_departamento; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_objetivo
    ADD CONSTRAINT fk_org_departamento FOREIGN KEY (org_departamento_id_responsable) REFERENCES public.org_departamento(id);


--
-- Name: bsc_proyecto fk_org_departamento; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto
    ADD CONSTRAINT fk_org_departamento FOREIGN KEY (org_departamento_id_responsable) REFERENCES public.org_departamento(id);


--
-- Name: org_departamento fk_org_departamento_padre; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_departamento
    ADD CONSTRAINT fk_org_departamento_padre FOREIGN KEY (org_departamento_id_padre) REFERENCES public.org_departamento(id);


--
-- Name: bsc_inventario_item fk_org_persona; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_inventario_item
    ADD CONSTRAINT fk_org_persona FOREIGN KEY (org_persona_id_registrado_por) REFERENCES public.org_persona(id);


--
-- Name: bsc_proyecto fk_org_persona; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bsc_proyecto
    ADD CONSTRAINT fk_org_persona FOREIGN KEY (org_persona_id_responsable) REFERENCES public.org_persona(id);


--
-- PostgreSQL database dump complete
--

