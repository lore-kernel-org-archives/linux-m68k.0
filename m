Return-Path: <SRS0=gNPH=ZA=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA458FA372C
	for <linux-m68k@archiver.kernel.org>; Fri,  8 Nov 2019 04:30:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80B4C21882
	for <linux-m68k@archiver.kernel.org>; Fri,  8 Nov 2019 04:30:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGQ+a/83"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729443AbfKHEaS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 7 Nov 2019 23:30:18 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38673 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728880AbfKHEaR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 7 Nov 2019 23:30:17 -0500
Received: by mail-pl1-f195.google.com with SMTP id w8so3199962plq.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 07 Nov 2019 20:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=GEvPrgPPegoWDjxGYmMInikn90DDnMAOw8xBaDl5kZA=;
        b=pGQ+a/83A9/0Nc2QLG/lrr1EYbt/bjvX3SE4LpTBgZGf0KilWjqO6VeOG6Jwcb1D23
         fj+jvlUeTjjSw255ZQykSDw3AJVbte/f/cE1oLe8M6sGNMwYNJK9ALY+tjxZheqDchxu
         uAZMm1A8J8KM9d9f92xRrv1AInfaJSQbOM4UjupIdxR+V8PDnlIAOjTNsXdQqC1CSA9i
         7NDAIlAd9wtaEkQI0UHHeMwVQpIhz75MXzB4PVA2lnJTqpyORABxoTq5C4z7RED5Jagj
         p7JTWMZQtDHju/NCEn/n/ZU5jW56e2cp+KSQRvmhV5kQrLQKAhFZLEAm61D2fgLPindm
         WN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=GEvPrgPPegoWDjxGYmMInikn90DDnMAOw8xBaDl5kZA=;
        b=YFSzFYfAy2kxmv0vZMBvvJQXM5DBZSttR3+rgQuM7/E4QpRmEIWcOEAPlk/HQbP7dq
         qzgKJTTog5/75fbcqx8gcdvbl4fHZeqg4WS5e+P8tHoLNI8eOJmyCCdyODneZzyQyrOr
         vSbGabI2kqaCH9JVPkAlmZ71FnVF+LXh7ZkmBXZUaMsbEyPF4woI+uSEgeib+i4Zacmp
         JpY7LKoyWkQniC+Tvj7xRG4adxaasej8YfII9oshLkycW/VLzTU3/+ZBUfiyOs4X59GT
         RQpz1r3pi+9mdy6voA9GHEQ4tOiBXX1nizK86nj4Ith421Hhb8ucDa8DVNioy0PjbAmb
         2crw==
X-Gm-Message-State: APjAAAUmb9Khtyl9fBT1Cc459VU/8fMiHTzsM9l4xLiI0AM4Pz6nXnzB
        NuvFcuiQA/933zdHIRF8y2M=
X-Google-Smtp-Source: APXvYqwQ686n7vNnzVLImLtqcTfZ3PQU/gu1LdOpnaXjAFca86+mHnqZ1aY/PwV9eAq6yZBUTvdpJw==
X-Received: by 2002:a17:90a:bf04:: with SMTP id c4mr10812587pjs.5.1573187416969;
        Thu, 07 Nov 2019 20:30:16 -0800 (PST)
Received: from [192.168.1.101] (122-58-182-39-adsl.sparkbb.co.nz. [122.58.182.39])
        by smtp.gmail.com with ESMTPSA id x70sm4621756pfd.132.2019.11.07.20.30.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Nov 2019 20:30:16 -0800 (PST)
Subject: Re: [PATCH v3 05/13] m68k: mm: use pgtable-nopXd instead of
 4level-fixup
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mike Rapoport <rppt@kernel.org>
References: <1572850587-20314-1-git-send-email-rppt@kernel.org>
 <1572850587-20314-6-git-send-email-rppt@kernel.org>
 <CAMuHMdUG3V7uxzhbetw75vVeobeP0-bQySb3r=0V5XujUF123g@mail.gmail.com>
 <20191104094748.GB23288@rapoport-lnx>
 <CAMuHMdVHsNyLxhaxZcVdLvQ1PUnb=2_+ECPWVD0234V+qu+kOw@mail.gmail.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        Greentime Hu <green.hu@gmail.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Jeff Dike <jdike@addtoit.com>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Salter <msalter@redhat.com>,
        Matt Turner <mattst88@gmail.com>,
        Michal Simek <monstr@monstr.eu>, Peter Rosin <peda@axentia.se>,
        Richard Weinberger <richard@nod.at>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        Russell King <linux@armlinux.org.uk>,
        Sam Creasey <sammy@sammy.net>,
        Vincent Chen <deanbo422@gmail.com>,
        Vineet Gupta <Vineet.Gupta1@synopsys.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-c6x-dev@linux-c6x.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-um@lists.infradead.org,
        sparclinux <sparclinux@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <3d908bbf-0469-c53b-dd86-87df98f40ee7@gmail.com>
Date:   Fri, 8 Nov 2019 17:29:58 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVHsNyLxhaxZcVdLvQ1PUnb=2_+ECPWVD0234V+qu+kOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Am 04.11.2019 um 22:53 schrieb Geert Uytterhoeven:
>>> This indeed boots fine on ARAnyM, which emulates on 68040.
>>> It would be good to have some boot testing on '020/030, too.
>>
>> To be honest, I have no idea how to to that :)
>
> Sure. This was more a request for the fellow m68k users.
> But don't worry too much about it.  If it breaks '020/'030, we can fix
> that later.

Boots fine on 030, too.

Cheers,

	Michael

