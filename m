Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D22538B
	for <linux-m68k@lists.linux-m68k.org>; Fri,  5 Jan 2024 03:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20230601.gappssmtp.com header.i=@landley-net.20230601.gappssmtp.com header.b="y+zNtwYK"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-680b1956ca4so5858466d6.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 04 Jan 2024 19:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20230601.gappssmtp.com; s=20230601; t=1704426265; x=1705031065; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9Mf84xFuyY+KXEL0NxI6rgus6ihvZvZ8KwrTqLyjZE=;
        b=y+zNtwYKLFkWZASkdqjiz0Fm/QIzzMTGpt8KgPlYpbM0yn8JsJc5aZ5CnL/EX/5k/e
         0m5CMPoZUVBb0C9CVtx8Hz4m7Czhjt32UySrsLyOP9X5vAYzkWi8CYvc/xs5ABi2agPG
         8ujfEK4GXI1jFK8Np+gWKPFMQ3+LHjE9seTSES+xyaVfpNi/MZpsXcnUeYSdauvv27SL
         AwNmCiPygwU1XxPeCN1WblbEFt3wKcCKhKdLEfbdPGWwaPXF2Dj4RFLGSVyk/MgohJGT
         YtfQPi3ZPzU6pg6n6aAxe/so6lvyptjnRc5EcQ5vgfqhHJmPV2APOwRCuD/Jvx2JQg+C
         FqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704426265; x=1705031065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9Mf84xFuyY+KXEL0NxI6rgus6ihvZvZ8KwrTqLyjZE=;
        b=J9bM4uwFKt5SFpnTPmKn0jsIPcg9wmHlYMrk8Gb/brln+hVVp0St+g7dGnKsdQBIsS
         p6ceS2GRqWn8N7eu0dAi9rhrU/TV5An6bktOhj9cEUXwtCUiCTKJESqoQCElPD/RsOlJ
         H9YZ8Yv3NYWnI6Z3OCR5cxIIcb9hFW44SYqPOq5u8dbfaUdaKhqlM8jqW+UyX047GCv6
         ZOKy8SubLznBB8EZBwl+zMXm1nJQp6VaPKh6quE35AZu7QQRs0vhFRTLRisN4hzhoRpk
         37U1pY3oe6vFY6b7rncHz6G+1i0MNKm+eVZZF4ih06IsOFBayqlwPuHEo5LQM68z0gaM
         tvGA==
X-Gm-Message-State: AOJu0Yw7I06klwQT0Tsdctmilh/suT9YJOf5Z33ysFbyYqtc/zmF0qHg
	GhmSNnToNL+7wmTC3hciAymCOYm4ue78GQ==
X-Google-Smtp-Source: AGHT+IE5c+alCyX1IwIj3VnIvG0UA9lij+ign+WLiqw65B1fGZND/Aeym1T7qiFm3gDYxSCgN4CMSg==
X-Received: by 2002:a05:6214:2602:b0:67f:5660:3e4 with SMTP id gu2-20020a056214260200b0067f566003e4mr1707272qvb.67.1704426264997;
        Thu, 04 Jan 2024 19:44:24 -0800 (PST)
Received: from [172.16.32.83] ([198.232.126.202])
        by smtp.gmail.com with ESMTPSA id eh17-20020a056214187100b0067f70cc986asm297636qvb.92.2024.01.04.19.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 19:44:24 -0800 (PST)
Message-ID: <8131b56d-937d-d7a9-0bab-99599617ad74@landley.net>
Date: Thu, 4 Jan 2024 21:50:51 -0600
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/36] Remove UCLINUX from LTP
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>,
 Li Wang <liwang@redhat.com>, Andrea Cervesato <andrea.cervesato@suse.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
From: Rob Landley <rob@landley.net>
In-Reply-To: <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/3/24 03:46, Geert Uytterhoeven wrote:
> Hi Petr,
> 
> CC other uClinux arch lists
> 
> On Wed, Jan 3, 2024 at 2:52 AM Petr Vorel <pvorel@suse.cz> wrote:
>> UCLINUX is broken in LTP and nobody really cares. Actually I dare to
>> say UCLINUX is dead. Therefore I prepared patchset to remove UCLINUX
>> from LTP. We have been actively removing UCLINUX from LTP during rewrite
>> tests to new LTP API. This removes the rest from the old tests (which
>> will be sooner or later rewritten to new API).
>>
>> Because the patchset is quite big, I did not want to send it to mailing
>> lists (but I can do it if you want).
>>
>> Can you please have look at my fork on gitlab, branch: remove-UCLINUX
>> https://gitlab.com/pevik/ltp/-/commits/remove-UCLINUX?ref_type=heads
>>
>> Build test:
>> https://github.com/pevik/ltp/actions/runs/7392470215
> 
> Thanks for your series!
> 
> I see you only CCed linux-m68k, but AFAIK, uClinux is not restricted
> to m68k/coldfire, but also available on arm32, riscv, sh, and xtensa.

Do you mean "nommu support", or do you mean the ancient distro Jeff Dionne
stopped maintaining in 2003?

Because I've been doing nommu musl-libc systems for a few years now. Works for me...

Rob
