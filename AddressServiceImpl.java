package by.burim.doing.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import by.burim.doing.service.AddressService;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class AddressServiceImpl implements AddressService {

}
