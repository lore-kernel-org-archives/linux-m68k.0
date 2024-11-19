Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A671D1F56
	for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Nov 2024 18:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732040711; cv=none; b=tIP4FXkOUlJeMuXBKun/qc228e7lLQZ2KKGd5WpyGE5qBfS7szROTLVWeAHThfr+8XlA12z8+HE1bShzW3OBPghf0z/eOs4qgrHEvvFZm37YQe0p8B7LJl1rtmIGe9lo02+TYQeZx0+6nX49VLQcJHCzcVoyIZmYvbjqQ0tMZVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732040711; c=relaxed/simple;
	bh=3lCPMoGWzLtjPygigc4f8Qery8A8aA+i1q7jzItIXhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujuniTo85jMyN1BnwahlIhwNgKEKZZTeH37e8i5jVZe726Pvwm2r8iCA9E/8C1CH86GdFPIjtVNm6zzbvurTQLlBXMHyzRSLr0xmNCdfVQELbjNL/lyJYsvVqQGcjsJxUxgVbjdvFbYQLtln2b1P/mHmXxF0A6BhzW7IQgR2DjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N64Zo5y5; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N64Zo5y5"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20e576dbc42so50029015ad.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Nov 2024 10:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732040709; x=1732645509; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZEJJbqKhA6/rkUUDEL+09UZPYvKjISi6zGv7/oCUow=;
        b=N64Zo5y5eve0bKVpdm4ybLgVmc3EWklTIAe0ys84FF648ouAmEJxmcmcmZIhptBeFD
         hDqaYDUsXI6130d6ff2Vz0vqYXg4TV0f6PmPHPjnrMi08ZwzUxenVrQIxiGsThu/V0+G
         xQ4lklc7+enZ/m4po/9SUZGpD/W4dwlz0UthNMy/M6NSPrOLPcSWFmf32YPW5iajkcel
         7zfyf/6h+EYg5+YUk4IVeToOqTDebuTArthB0fCMTrqA9kiUMfRXHgci9Mkc1AmgwhiV
         7GjMGi57X711vPCXU/w1b5J2DQwvOvijtDFFczb4Wh17Y/2Cb//vepN9p7GL2esK78hz
         1mzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732040709; x=1732645509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZEJJbqKhA6/rkUUDEL+09UZPYvKjISi6zGv7/oCUow=;
        b=jhA7aPRBjNZoaH3qGtmGWWpnHF6/0VzKgY1JExhz66H4z+toBXUcjfrFkIL4Xqm9dw
         DAry6PmtjYg5B2dcX8rGA16tahTI5jX12Ji+P3DJRi6DgbRUKQjHAu7uyPfbD/+CTiNA
         MKZhlvNRfz/LLtekGcDl6L7W+RkEDSzIka7PAGeoFekSQ163xFa7nyQpmp9t6pMtCV4S
         hlfRTvCoUGcjBRSVsVQZu3xC6VObbTzxFCdP5Mu/Ka7HV65rMAhp09hlg2S3vWOtO6lq
         57kfYCRvV9qn95+zm5iSmBbwPpxKAfBFHg0xBjm8coF1SD3UywI593UwqCDNRdnGtARQ
         g0pQ==
X-Gm-Message-State: AOJu0YyNI4BgNTnpHdCHRqNoWm/gQFgek+MikKiVRB2PZvx25tCwlPVX
	8KREiz0VuaG4b/+eRfXEkMmIcwYR9N9LirIZmyzi5MBMevbovEhO
X-Google-Smtp-Source: AGHT+IHEKPK2gDXuWitcGqHFUrYnkJinjSfF+0szEdvRBnZ7yxgNS1534jjas5HYKrE1D6v5KG3XfA==
X-Received: by 2002:a17:903:1381:b0:212:3f36:cee6 with SMTP id d9443c01a7336-2123f36d4camr76832785ad.33.1732040708629;
        Tue, 19 Nov 2024 10:25:08 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:a422:b23c:53c7:43fb? ([2001:df0:0:200c:a422:b23c:53c7:43fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21268a24db6sm1535505ad.13.2024.11.19.10.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 10:25:07 -0800 (PST)
Message-ID: <1fbfc00d-27c0-4486-816d-50291bebc842@gmail.com>
Date: Wed, 20 Nov 2024 07:25:29 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] Add basic tracing support for m68k
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Tomas Glozar <tglozar@redhat.com>
References: <20241021-add-m68k-tracing-support-v1-0-0883d704525b@yoseli.org>
 <3a8f6faa-62c6-4d32-b544-3fb7c00730d7@yoseli.org>
 <20241115102554.29232d34@gandalf.local.home>
 <cbb67ee2-8b37-4a4d-b542-f89ddae90e94@yoseli.org>
 <20241115145502.631c9a2c@gandalf.local.home>
 <2c43288a-517d-4220-ad31-f84dda8c1805@yoseli.org>
 <20241118152057.13042840@gandalf.local.home>
 <22856ed6-b9d0-4206-b88d-4226534c8675@yoseli.org>
 <20241119102631.76363f2a@gandalf.local.home>
 <20241119112850.219834f5@gandalf.local.home>
 <e4456cb1-b1bc-453b-b3b5-3ee4f03995be@yoseli.org>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <e4456cb1-b1bc-453b-b3b5-3ee4f03995be@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Steve,

On 20/11/24 07:06, Jean-Michel Hautbois wrote:
>
>> You reference two variables that are not part of the event:
>>
>>   "mem_map" and "m68k_memory[0].addr"
>>
>> Do these variables ever change? Because the TP_printk() part of the
>> TRACE_EVENT() macro is called a long time after the event is 
>> recorded. It
>> could be seconds, minutes, days or even months (and unlikely possibly
>> years) later.
>
> I am really not the best placed to answer.
> AFAIK, it sounds like those are never changing.

m68k_memory[0].addr never changes (that segment is usually where the 
kernel is loaded to, and can't be hotplugged).

mem_map is equal to NODE_DATA(0)->node_mem_map on m68k 
(mm/mm_init.c:__init alloc_node_mem_map()) and won't change either.

Cheers,

     Michael

>
>>
>> The event takes place and runs the TP_fast_assign() to record the 
>> event in
>> the ring buffer. Then some time later, when you read the "trace" 
>> file, the
>> TP_printk() portion gets run. If you wait months before reading that, 
>> it is
>> executed months later.
>>
>> Now you have "mem_map" and "m68k_memory[0].addr" in that output that 
>> gets
>> run months after the fact. Are they constant throughout the boot?
>
> I don't know.
>
>> Now another issue is that user space has no idea what those values 
>> are. Now
>> user space can not print the values. Currently the code crashes 
>> because you
>> are the first one to reference a global value from a trace event 
>> print fmt.
>> That should probably be fixed to simply fail to parse the event and 
>> ignore
>> the print format logic (which defaults to just printing the raw fields).
>
> The patch you sent works...
> But, it fails a bit later:
> Dispatching timerlat u procs
> starting loop
> User-space timerlat pid 230 on cpu 0
> Segmentation fault
>
>
>>
>> -- Steve
>>
>
>
