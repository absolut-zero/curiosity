const selectize = () => {

  $('.js-input-tags').selectize({

    delimiter: ',',
    persist: false,
    create: function(input) {
      return {
          value: input,
          text: input
      }
    }

});

};

export { selectize };
