package com.oor.core



import org.junit.*
import grails.test.mixin.*

@TestFor(CabinetController)
@Mock(Cabinet)
class CabinetControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cabinet/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cabinetInstanceList.size() == 0
        assert model.cabinetInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cabinetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cabinetInstance != null
        assert view == '/cabinet/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cabinet/show/1'
        assert controller.flash.message != null
        assert Cabinet.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cabinet/list'

        populateValidParams(params)
        def cabinet = new Cabinet(params)

        assert cabinet.save() != null

        params.id = cabinet.id

        def model = controller.show()

        assert model.cabinetInstance == cabinet
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cabinet/list'

        populateValidParams(params)
        def cabinet = new Cabinet(params)

        assert cabinet.save() != null

        params.id = cabinet.id

        def model = controller.edit()

        assert model.cabinetInstance == cabinet
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cabinet/list'

        response.reset()

        populateValidParams(params)
        def cabinet = new Cabinet(params)

        assert cabinet.save() != null

        // test invalid parameters in update
        params.id = cabinet.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cabinet/edit"
        assert model.cabinetInstance != null

        cabinet.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cabinet/show/$cabinet.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cabinet.clearErrors()

        populateValidParams(params)
        params.id = cabinet.id
        params.version = -1
        controller.update()

        assert view == "/cabinet/edit"
        assert model.cabinetInstance != null
        assert model.cabinetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cabinet/list'

        response.reset()

        populateValidParams(params)
        def cabinet = new Cabinet(params)

        assert cabinet.save() != null
        assert Cabinet.count() == 1

        params.id = cabinet.id

        controller.delete()

        assert Cabinet.count() == 0
        assert Cabinet.get(cabinet.id) == null
        assert response.redirectedUrl == '/cabinet/list'
    }
}
