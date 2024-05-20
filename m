Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23D21D531
	for <linux-m68k@lists.linux-m68k.org>; Mon, 20 May 2024 21:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716239037; cv=none; b=M0GuWLu5Q8Zxu9abtDWbFc1Ltm5acbzp+YQwnc2qs0aVo8Ys7TYS/pRaEuSPFd0xxZ9h6CT+TR8f8EJ9kaI9n6b8si0aFwDyUey5pav8SFmKjOIMq8+j/Q5reF1mOl3BGzD+Qsfyq6uGPcXeKu9tgOsH9cdxOVknq4sZeL2yn8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716239037; c=relaxed/simple;
	bh=YP+/mrfsaFktOlq3QT3649mgIJ6g9uv0jiRFHBQEg54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4ezVLFUgezelA3mQygSRorlvGyUuitPnWVyUUjCBzsYeg1eeQEVGmUEUsIzqKDfcTguKKnkmEac5DtHnaej+RPiFVLDMEzlTeQWiVJSFNR5jZAqKTr+4VqaGz4/WbvtAhT/nY0w1gwWn6ODdPKnwiSflAQKuDm0eJpeX7hyagk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Idtran2E; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Idtran2E"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ee5235f5c9so85851165ad.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 May 2024 14:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716239035; x=1716843835; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4uXlVBR8sp2+tjU+lpua9+vEIk3Elljs5PPoWzVOTFU=;
        b=Idtran2ESo/AfNjtXdvbvegKtnPSAcZZ3Qy4lTbLL1aF73TlYfwx+BAhAJRbkg1lNC
         2PDb3xPMqgkt0tog6XSWsu5EeRqoUIPX8eGni5nvKklE8mqcOlDJk2HC7ExLXHBij2HJ
         Cm0hdiW4W9cqXmuyhGSVAAUxit3exTE/Cm1PZuajqzBu18WCuKrWrk2cLLzN+IpzUxJv
         Wks3x1JSL6qfvTwoxbYLp8jxhhj1jICaz8Wmn76YAopI8bcLX64YfMKxtwd8evGmzUkE
         XMylgN8meNMiBNANS/O5fdgABhoZOazq+7vPjIsBHgYGR4OWhde62myPJB0DPK0RKg1V
         4gsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716239035; x=1716843835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4uXlVBR8sp2+tjU+lpua9+vEIk3Elljs5PPoWzVOTFU=;
        b=xQtCa6ZVLDow445f/3xtJmg32yNN90szb3i37YnjPimCwcsIA85lbpXhFJSkTJVX40
         sAAkqivGvG023RF89RNS01ZITZ7luXMMEeUwKJu3g0Rg0buLQE49Xcu2Q1/OmeGwnJbD
         e+eHSbvll9nNDcNlQ4ubhj87T24daxwwXttB/dGbMQC8BQpgXIJ6CVbXftgM/pLhc/vV
         BB5sEPI8PP/nv1ja1c8sX00Bzf8ffcQ6gK0ODrHQoHD3eNQOq2TAosSV/o2iDpWh5UlE
         /jhVVqpeTYfh6A8EWaFBrIx5y4yTgTBhpmQZoyOxuK6Rs55lUOTD/DiceI3sOUjAGfSM
         Xkmg==
X-Forwarded-Encrypted: i=1; AJvYcCU+sAoxxTlC1GvopPvGi3HdsktukW3HGs1RRYoOsOu9s3CRowb9ovf9HZDuU3eXTF8wRM/LrzATuxMe/NHnae1A3noIMOSHiCAacDQSb11I
X-Gm-Message-State: AOJu0YyzknVeXXZssxmcRaplrBR3dm2XO7yEwUdpJt4vjUsLofeQ1CEg
	BvpHF2BKIUUOxtWKVia+7grmyLnmw1KPKhYo3iJwuRIED75XKqikbz0nMw==
X-Google-Smtp-Source: AGHT+IET3elem+OgWq89jBwl9Bc/cKovsRf6h+8nwFoGtptrAdHykz7zyrSo+piJwbcjkWPzQ9JnNg==
X-Received: by 2002:a17:902:7287:b0:1e4:c959:2b65 with SMTP id d9443c01a7336-1ef43e28484mr263627855ad.41.1716239035192;
        Mon, 20 May 2024 14:03:55 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f2f4fe62d3sm38663965ad.103.2024.05.20.14.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 14:03:54 -0700 (PDT)
Message-ID: <cc98192b-3eba-47d8-8faa-e346041e7e04@gmail.com>
Date: Tue, 21 May 2024 09:03:58 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Amiga, serial and SYSRQ
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paolo Pisati <p.pisati@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <ZkjwzVwYeQtyAPrL@amaterasu.local>
 <e9d97c04-73c2-e6dd-6d51-b9a4e3ef73b2@gmail.com>
 <CAMuHMdWL2S1OMS5ikKgQj2uohoiL6_a5FLwdCphUEBVtMOSFcA@mail.gmail.com>
 <6321b7d3-ee31-45eb-bb5f-28a2c74cb7fa@gmail.com>
 <CAMuHMdWHQRGGeqVJ_DQEXP5ogRL=NqzStYQ92Tt8-TWw9ksTDA@mail.gmail.com>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdWHQRGGeqVJ_DQEXP5ogRL=NqzStYQ92Tt8-TWw9ksTDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

On 20/05/24 08:09, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Sun, May 19, 2024 at 9:22 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 19/05/24 21:17, Geert Uytterhoeven wrote:
>>> On Sun, May 19, 2024 at 9:37 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>>> On a serial console, SysRq is BREAK:
>>> s/serial console/virtual console/
>> I meant to write 'serial console' there. You will note that I carefully
>> avoided the topic of sysrq on the virtual consoles because I could find
>> no information on the key combo,
> Right, I got totally confused by your two lines starting with "On",
> incorrectly assuming the first was for virtual consoles, and the second for
> serial consoles...
>
>>> Amiga keyboards do not have a SysRq key.  We used to implement it
>>> using SHIFT+ALTGR+HELP in the old drivers/char/amikeyb.c, but that
>>> feature was lost with the transition to drivers/input/keyboard/amikbd.c
>> Thanks - same problem in atakbd.c. What key is 'KEY_102ND'? Does it even
>> exists on our keyboards?
> That is the keycode generated from raw Amiga keycode 0x30?
> According to [1] it is present on some international layouts.

Pity - that's useless for sysrq in the general case then.

Does anyone really need the Help key? Should we make that one return the 
sysrq keycode rather?

Cheers,

     Michael

>
> [1] https://wiki.amigaos.net/wiki/Keymap_Library#Keyboard_Layout
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
