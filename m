Return-Path: <SRS0=ttaO=YV=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35598CA9EA0
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Oct 2019 06:58:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE48D20873
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Oct 2019 06:58:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCmfpddr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730675AbfJ1G6A (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Oct 2019 02:58:00 -0400
Received: from mail-pg1-f169.google.com ([209.85.215.169]:39264 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbfJ1G6A (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Oct 2019 02:58:00 -0400
Received: by mail-pg1-f169.google.com with SMTP id p12so6252958pgn.6
        for <linux-m68k@vger.kernel.org>; Sun, 27 Oct 2019 23:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=iIIrq6hWcK6aIcAc6gwsRbOGt2hw/V5MfI3qLwaylo4=;
        b=qCmfpddrWiwjz1LDRo0IEz47mP5Rr59bYC2icjlIx1rorK1VKVvoO8KY6NAc48L7L4
         0V//pPaSeDZb1t/PR6TZapXcRJpx7hEMKxFpRwz1lJLN1Bz+q7b+0dSqxfJTeqf4EJl+
         +GetPC9YmF25mSPBhht/sDGel9wp40/5ohfsAswsbDXIYO4mueect7BUnCAQj11YOUES
         EMpKQCcUve1+dKN6Y1CH2gQGPIy3eVtKn+MZJ/V/Co9B7lfoqtykThX2wIwfABXZZQMF
         Bq+ienyz+0jiHnhLsY9VUm+xfPblZG4122wWzp0Jls96jBXHUKqSrYoieNHqdYg8l7IL
         Ed2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=iIIrq6hWcK6aIcAc6gwsRbOGt2hw/V5MfI3qLwaylo4=;
        b=BW8FHuQ3CI5WRDt0Lz1zrBZ4Vbk1uzz7dPIVRHeh2NUox25dwFxM72lDdAMP3u+5Ys
         VgX2V3gkP8G33NNEku0AIGHLlLpjyWYsGrpnJb9Lbj43vQm63zGq9Z0lBOxaNFZwqegj
         ma9VHXSzXkE6BbXZG+H2R3+Lwb2AYQ9EoAh99exZumbGZlTrql+/6zLQKrV3VMYnLif0
         PBVwr1u3VEalhfZhVm8UHCZaUedW32LVRLG02/qgCXBX8V9u1bIVf6z1aEJK0zLPJj32
         ka/decVUrRIYUbLpoN/pWrqSELHBjj6kBVwelCORlf4nyaRiqwU1NsZi3tXCnDwwo1Q9
         EHuQ==
X-Gm-Message-State: APjAAAWnlOfAIieNEDqTPtM+5MobmxWIVFT+5qDHKoQONe+1/Ik4zlCe
        GYuPkU6MRMg+qOy3Pi2FUSg/7Zdb
X-Google-Smtp-Source: APXvYqyNCnpMhKAwd3q1q6XyKurIy3Q1IQQfEgnOPIB9dClQ20bw+9mKmfj/4luYJqFWgPhD+fpzQw==
X-Received: by 2002:a63:6d8b:: with SMTP id i133mr18998154pgc.241.1572245879471;
        Sun, 27 Oct 2019 23:57:59 -0700 (PDT)
Received: from [192.168.1.101] (122-58-182-39-adsl.sparkbb.co.nz. [122.58.182.39])
        by smtp.gmail.com with ESMTPSA id c12sm5323017pfp.178.2019.10.27.23.57.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Oct 2019 23:57:58 -0700 (PDT)
Subject: Re: Amiga PCMCIA network card support
To:     Kars de Jong <jongk@linux-m68k.org>,
        Andreas 'count' Kotes 
        <count-vger.kernel.org+linux-m68k@flatline.de>
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
 <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
Cc:     linux-m68k <linux-m68k@vger.kernel.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <abf16e20-1f80-76da-691e-e4e041ac955e@gmail.com>
Date:   Mon, 28 Oct 2019 19:57:54 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Kars,

Am 25.10.2019 um 20:25 schrieb Kars de Jong:

> 2) Rework <asm/io.h> so inb()/inw()/inl(), outb()/outw()/outl(),
> insb()/insw()/insl() and outsb()/outsw()/outsl() "just work" for
> PCMCIA address space without having to create ugly hacks in the
> generic drivers. This is not trivial because of the strange memory
> mapping of the Amiga PCMCIA slot.

If you can come up with a way to achieve that (somehow selecting between 
8 bit and 16 bit mode at run time), I'd love to hear about it. I've 
experimented a bit with the ne.c driver to allow for run time selection 
of the correct IO access functions, but never came up with something 
that I'd expect to get past the netdev folks.

> 3) ...
> 4) Profit!
>
> Oh, the 3c589_cs driver needed an ugly hack because some of the
> registers just didn't read out properly on the Amiga with 16-bit
> access. That issue is also described in the source code for the
> AmigaOS driver.

Precisely, and this is the main reason why we can currently compile the 
driver for either 8 bit or 16 bit access, but not both.

@Andreas: I've sent a rough draft of a isp1763 driver to Adrian Glaubitz 
and Michael Karcher a few months ago. Doesn't do anything useful yet, 
and needs someone debugging where it goes wrong carefully.
That was based on 4.18, but shouldn't be hard to get ported to 5.x. I 
can resend that if there's any interest.

Cheers,

	Michael
