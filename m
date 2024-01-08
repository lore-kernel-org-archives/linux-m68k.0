Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305F712B71
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Jan 2024 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YLldKw//"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d5f40ce04so18242585e9.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Jan 2024 00:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704702881; x=1705307681; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GfLQg2J+OwD4mK8aB87IakjXF3Kgfssqm9r5be44QF4=;
        b=YLldKw//QHbG4hecdnKdslQTUqp9h0aO2Eo6xSDNANSg1h7m8BXrec7wo9cPXU+V10
         W0MwBMUHuBlrSLBaUnzR2H3oygxoPsaww5u1THLEX/bIA+9j3Q2Frv/t6N9DWwxeLsQZ
         x2PKBn8qVidNmQI94H78kCyilLkYW8rsbE9Bg3wUeJ0YvYsxhIC6cmKo9iLalT9mvtFD
         j342fE5KKC9d2cjuO4S87aXM59RwHz3t8gTfh/0sA6lde5gV6+xT1BMFLmlTnHsWsiBE
         HDiR+i9gv2VRzmEEDoyr6B2Wf8qdTUOajxiPkcQTaPt94Q7Nfj74VQJK7KZYfjImlmO9
         WkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704702881; x=1705307681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GfLQg2J+OwD4mK8aB87IakjXF3Kgfssqm9r5be44QF4=;
        b=uLBBe04UKcFHrYlFymxJk4GedhV6f9PhX/GsCNz9UIw+fU+KXRkYLL5LLZX+kRgrjq
         KaykWZ/q43gpTI1Q2o5v+2RpmqIDvCEQca67WQMC8cKJrpPFAwCEDWd3DWREkgfaPZYc
         MiT4kvbsL8TGdO5MccIxDGXa0Z66ARTZAwpLzA4EJW8SGZ0J4eR40VMqZ4QR1391PJa4
         sFJsxqg3UnQYayzGKTmF4FV9D0B3NyDdvZ78YYOX5z1D01v4t7LTwa4WOIaRS0MQIejq
         CdTPR0W51NFR7+XAvNGZuGbfgOXQqJr96fkqThxSlyYfADkgp8Vtj6vDxrFdTP8UWPbv
         OKxA==
X-Gm-Message-State: AOJu0Yy5W/1/ZNVmrdSvWtGhhRZKa1Nm0uBpXdM3bTymJqM5sNrJckv4
	9ubDHiUqspQRvyPAgb8aYYDQSIX4sYQwfw==
X-Google-Smtp-Source: AGHT+IG/mp6y+0cYUrDCavig/3hnnulb4tFtsRjSF6zEM6NAi6nWZTX4f7mAdVBvGKSLQG0+ZSf0JA==
X-Received: by 2002:a05:600c:3ac6:b0:40e:4785:276f with SMTP id d6-20020a05600c3ac600b0040e4785276fmr507460wms.100.1704702881399;
        Mon, 08 Jan 2024 00:34:41 -0800 (PST)
Received: from [172.20.10.3] ([37.161.21.69])
        by smtp.gmail.com with ESMTPSA id fc7-20020a05600c524700b0040d7b340e07sm10122595wmb.45.2024.01.08.00.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 00:34:40 -0800 (PST)
Message-ID: <6fd9dcfa-b412-4573-a2c7-e4ded89bb225@suse.com>
Date: Mon, 8 Jan 2024 09:34:35 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/36] Remove UCLINUX from LTP
To: Rob Landley <rob@landley.net>, Cyril Hrubis <chrubis@suse.cz>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it,
 Li Wang <liwang@redhat.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik>
 <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
 <ZZVOhlGPg5KRyS-F@yuki> <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
Content-Language: en-US
From: Andrea Cervesato <andrea.cervesato@suse.com>
In-Reply-To: <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

My 2 cents. I'm working on refactoring growfiles test which uses UCLINUX 
flag.
During its development I had occasion to check UCLINUX support and 
(indeed) it seems pretty
broken for LTP, because nobody is maintaining it for a while and such 
tests use old API that will
be replaced in any case sooner or later. I agree with other people about 
removing it, unless there's
a valid reason to keep it.
Just in case we want to keep it, someone should take care about UCLINUX 
support, testing LTP releases for it as well, but it doesn't seem like 
something we can do inside the LTP devs team due to the lack of resources.

Regards,
Andrea

On 1/5/24 04:52, Rob Landley wrote:
> On 1/3/24 06:09, Cyril Hrubis wrote:
>> Hi!
>>> I am not sure I agree with this series.
>>> Removing support for UCLINUX from LTP is almost a guarantee for
>>> not noticing when more breakage is introduced.
>>>
>>> How exactly is UCLINUX broken in LTP?
>> As far as we know noone is using it and nobody is maintaing it for a
>> decade,
> Nobody is maintaining "uclinux" because that was a distro, but you can build
> nommu support in buildroot and such, and people do.
>
> Rob


