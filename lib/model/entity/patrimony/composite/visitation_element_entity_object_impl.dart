import 'package:portal_eclb/dependency/dependecy_injector.dart';
import 'package:portal_eclb/model/entity/abstract_entity_object.dart';
import 'package:portal_eclb/model/patrimony/composite/visitation_element_entity_object.dart';
import 'package:portal_eclb/model/patrimony/composite/visitation_element.dart';
import 'package:portal_eclb/resource/dao/dao_factory.dart';
import 'package:portal_eclb/resource/dao/patrimony/composite/visitation_element_dao.dart';
import 'package:portal_eclb/resource/session/database_session_manager.dart';
import 'package:portal_eclb/utils/environment_configuration.dart';


final class VisitationElementEntityObjectImpl extends AbstractEntityObject implements VisitationElementEntityObject {

  VisitationElement _dto;

  VisitationElementEntityObjectImpl(super.databaseSessionManager, super.environmentConfiguration, this._dto);

  @override
  Future<bool> delete() async {
    DependencyInjector dependencyInjector = DependencyInjector.getInstance();

    DAOFactory factory = dependencyInjector.getDAOFactory(this.environmentConfiguration.get("dbms"));

    VisitationElementDAO dao = factory.createVisitationElementDAO(databaseSessionManager);

    try {
      return await dao.delete(this._dto.id as Object);
    } catch (error){
      rethrow;
    }
  }

  @override
  Future<bool> insert() async {

    DependencyInjector dependencyInjector = DependencyInjector.getInstance();

    DAOFactory daoFactory = dependencyInjector.getDAOFactory(environmentConfiguration.get("dbms"));

    VisitationElementDAO dao = daoFactory.createVisitationElementDAO(databaseSessionManager);
    try {

      return await dao.insert(this._dto);
    } catch(error) {

      rethrow;
    }
  }

  @override
  Future<bool> update() async {
    DependencyInjector dependencyInjector = DependencyInjector.getInstance();

    DAOFactory daoFactory = dependencyInjector.getDAOFactory(environmentConfiguration.get("dbms"));

    VisitationElementDAO dao = daoFactory.createVisitationElementDAO(databaseSessionManager);

    try {
      return await dao.update(this._dto);
    } catch (error) {
      rethrow;
    }
  }

  int? get id {
    return this._dto.id;
  }


  void set id(int? id) {
    throw UnimplementedError();
  }


  String? get description {
    return this._dto.description;
  }


  void set description(String? description) {
    this._dto.description = description;
  }

  static Future<VisitationElement> getById(DatabaseSessionManager databaseSessionManager, EnvironmentConfiguration environmentConfiguration, int id) async {
    DependencyInjector dependencyInjector = DependencyInjector.getInstance();
    DAOFactory daoFactory = dependencyInjector.getDAOFactory(environmentConfiguration.get("dbms"));

    VisitationElementDAO dao = daoFactory.createVisitationElementDAO(databaseSessionManager);

    try {
      return (await dao.findById(id)) as VisitationElement;
    } catch (error) {
      rethrow;
    }
  }

  static Future<List>? getAll(DatabaseSessionManager databaseSessionManager, EnvironmentConfiguration environmentConfiguration, [int limit = 0, int offset = 0]) async {
    DependencyInjector dependencyInjector = DependencyInjector.getInstance();
    DAOFactory daoFactory = dependencyInjector.getDAOFactory(environmentConfiguration.get("dbms"));

    VisitationElementDAO dao = daoFactory.createVisitationElementDAO(databaseSessionManager);

    try {
      return await dao.findAll(limit, offset);
    } catch (error) {
      rethrow;
    }
  }


}