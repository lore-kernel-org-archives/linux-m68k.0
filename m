Return-Path: <SRS0=kyu6=Y6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F75CC5DF62
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Nov 2019 07:29:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F39902173B
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Nov 2019 07:29:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGcJVGIO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729958AbfKFH3S (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Nov 2019 02:29:18 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35461 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729896AbfKFH3S (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Nov 2019 02:29:18 -0500
Received: by mail-pg1-f193.google.com with SMTP id q22so8922528pgk.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2019 23:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=CZXGdk9uFu2d7V8fak5kkfAh72DjR9+d3K1XsYdLz38=;
        b=oGcJVGIO9nAfwZ9U9gs9P3ysGflXOrasF6qEiEhb6WpEy/r0O4b4WcXcLFHBABCJ7R
         QUOnBvxM0K+ORQ5GEwdd68Rbvuyj5JajApo+O20Qk7aw+1UO9FWS+6+LzSfRmtqSLrdq
         xvCHWuUmC+aEABOOmXkQjFb1AvmC1AZ+Bwjcb+sSQtS1GRTuQLMEbpuch+Wd9OB5B9nR
         MEP3ZWqL3l8J6HAnG5DRusZtOBOPsYcpMAZ4FMs88UBSyQ00BeMuWCLwvOdu7PSHWk++
         XtgmclZQxAc89Qmj6l/gKcwAVt76pZv/YKMWttV48g2arcZGneYo8SkwGAFkxvqsnIJf
         JInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=CZXGdk9uFu2d7V8fak5kkfAh72DjR9+d3K1XsYdLz38=;
        b=ix2R4Qehj/0Xna955wHgDmrAENHKBAu8KRO/DYWWRnhXc/fMY6QmDcHwS1B+pGJmxZ
         Q1g4XXG40mNN673Ggx7nisB7Fgx+Fey3SkmLOAjfeBkW80s9nT/w3dUb3R1IGJ+vBUL7
         GR4xrk+FvTbzqzZbPY16xkGKmvakq5r2m5FwycUDJzWMI2DxNhIWPGWbtXv7+2/pTB8M
         Q10yTonWDM+rmfbOyiObvW/AbBeN4kn36Aworx7jF4kmlIz+UlcuERaRIG3wTYzXkVri
         Pxx7Mx3H/K6IdAs9KC0A1U4tw4P7PbZT5su0hI8/i1Ak6JuohfkTp8jGs4vkvdwZrPCd
         vpGA==
X-Gm-Message-State: APjAAAVvDARsnw6CbOxpjcPWlhm2LoYXeoNUk5CtB9nl6dpaAnxYFeaN
        4yn6qvtz6K8yqzPPVeZm8W0=
X-Google-Smtp-Source: APXvYqxBVXh1jmjAePr3S1g4NtkWBhTLAIl9OTaZqYXb6wMgMaiO3o4Y3mgSEbDLjoLjMA38tOeOfg==
X-Received: by 2002:a62:90:: with SMTP id 138mr1557534pfa.209.1573025356612;
        Tue, 05 Nov 2019 23:29:16 -0800 (PST)
Received: from [192.168.1.101] (122-58-182-39-adsl.sparkbb.co.nz. [122.58.182.39])
        by smtp.gmail.com with ESMTPSA id h13sm26505185pfr.98.2019.11.05.23.29.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 23:29:15 -0800 (PST)
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
Message-ID: <15fafca0-e4c4-1f46-4f19-9b2a177f7d6b@gmail.com>
Date:   Wed, 6 Nov 2019 20:28:59 +1300
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

I heard you :-) Still doing more regression testing on the latest SCSI 
fix, but I can schedule this next.

Cheers,

	Michael

> But don't worry too much about it.  If it breaks '020/'030, we can fix
> that later.
>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
