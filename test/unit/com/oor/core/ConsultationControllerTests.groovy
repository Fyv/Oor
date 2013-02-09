package com.oor.core



import org.junit.*
import grails.test.mixin.*

@TestFor(ConsultationController)
@Mock(Consultation)
class ConsultationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/consultation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.consultationInstanceList.size() == 0
        assert model.consultationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.consultationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.consultationInstance != null
        assert view == '/consultation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/consultation/show/1'
        assert controller.flash.message != null
        assert Consultation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/consultation/list'

        populateValidParams(params)
        def consultation = new Consultation(params)

        assert consultation.save() != null

        params.id = consultation.id

        def model = controller.show()

        assert model.consultationInstance == consultation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/consultation/list'

        populateValidParams(params)
        def consultation = new Consultation(params)

        assert consultation.save() != null

        params.id = consultation.id

        def model = controller.edit()

        assert model.consultationInstance == consultation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/consultation/list'

        response.reset()

        populateValidParams(params)
        def consultation = new Consultation(params)

        assert consultation.save() != null

        // test invalid parameters in update
        params.id = consultation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/consultation/edit"
        assert model.consultationInstance != null

        consultation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/consultation/show/$consultation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        consultation.clearErrors()

        populateValidParams(params)
        params.id = consultation.id
        params.version = -1
        controller.update()

        assert view == "/consultation/edit"
        assert model.consultationInstance != null
        assert model.consultationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/consultation/list'

        response.reset()

        populateValidParams(params)
        def consultation = new Consultation(params)

        assert consultation.save() != null
        assert Consultation.count() == 1

        params.id = consultation.id

        controller.delete()

        assert Consultation.count() == 0
        assert Consultation.get(consultation.id) == null
        assert response.redirectedUrl == '/consultation/list'
    }
}
