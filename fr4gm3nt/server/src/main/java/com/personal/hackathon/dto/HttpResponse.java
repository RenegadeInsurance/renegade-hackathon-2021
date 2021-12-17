package com.personal.hackathon.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class HttpResponse {
    private Object data;

    public HttpResponse(Object o){
        this.data = o;
    }

    public static HttpResponse of(Object o){
        return new HttpResponse(o);
    }
}
