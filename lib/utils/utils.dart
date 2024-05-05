String getImageUrl(String icon) {
  if (icon == '01d') {
    return 'assets/icons/01d.png';
  }
  if (icon == '02d') {
    return 'assets/icons/02d.png';
  }
  if (icon == '03d') {
    return 'assets/icons/03d.png';
  }
  if (icon == '04d') {
    return 'assets/icons/04d.png';
  }
  if (icon == '09d') {
    return 'assets/icons/09d.png';
  }
  if (icon == '10d') {
    return 'assets/icons/10d.png';
  }
  if (icon == '11d') {
    return 'assets/icons/11d.png';
  }
  if (icon == '13d') {
    return 'assets/icons/13d.png';
  }
  if (icon == '50d') {
    return 'assets/icons/50d.png';
  }

  return 'assets/icons/01d.png';
}

String getImageUrlById(int id) {
  if (id >= 200 && id < 300) {
    return 'assets/icons/11d.png';
  }
  if (id >= 300 && id < 400) {
    return 'assets/icons/09d.png';
  }
  if (id >= 500 && id < 600) {
    return 'assets/icons/10d.png';
  }
  if (id >= 600 && id < 700) {
    return 'assets/icons/13d.png';
  }
  if (id >= 700 && id < 800) {
    return 'assets/icons/50d.png';
  }
  if (id == 800) {
    return 'assets/icons/01d.png';
  }
  if (id > 800) {
    return 'assets/icons/02d.png';
  }

  return getImageUrl('01d');
}
