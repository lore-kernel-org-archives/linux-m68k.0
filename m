Return-Path: <SRS0=LIUq=77=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35424C433E4
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Jun 2020 07:11:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1239421548
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Jun 2020 07:11:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXgQwarb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgFRHL1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 18 Jun 2020 03:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727979AbgFRHLX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 18 Jun 2020 03:11:23 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E7EFC06174E
        for <linux-m68k@lists.linux-m68k.org>; Thu, 18 Jun 2020 00:11:21 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id w1so4617702qkw.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 18 Jun 2020 00:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=tZuMcx5Ncme+d4Lp4c48U5HqvIoa+gxuqqFV8idyawI=;
        b=bXgQwarblcVJ4iYN7DUYNzP16WnotXVz0oOQ+dhDHa2UNbGwIbLAYkqzcAoccBFSLC
         /fB56FiOD6ygKIPk/HRCY6lX4o8P+c+JUrpCaR/GiRTG5/3q2R6gA7VWWyQEzlDAxKMv
         5/PQia4oi8Tnou64v6wPYaBqr1Z3eozOjdk4Q4fQoVmTm1fuYH1oei7/i6t3ZVy1HKVT
         N3JMBP0TFup8+SH55Mxgl9adfw6bxNF3N4n2HRjXvEW2be/rlVjExNtx5hOqZBWpzgx8
         nULbheoGb6Zjhulzj/JDgjGbvNoZj5HgBMAMdKfamsoYIXc7Fgn1MR1ju0czs7NIAvMI
         t1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=tZuMcx5Ncme+d4Lp4c48U5HqvIoa+gxuqqFV8idyawI=;
        b=EYi2W0Dc0uW7l70FZeyABRLyvlO69dKjbyNNo7WqnDRKh5WwCs3cLqUYWck4+bnopX
         /jDK5XhYQAf+MIfCtUow58V1Jjw7z5Uu/jCxX5GNnV9a48FEH9KoHdNp7ZyL9aFUpWuC
         CCR1SktTAbl/kMcgO7CWtX1w+TLjMFLqZgm53dOSLv7Fh4Vr9qOBG4Q9FhuVa6IOyWkx
         UX/JpqTBX55hhwWCFjqN5Sfw41DT+sr/gCBJwGAEmvr/exysxFXjxOro/8c1NgdSLkxH
         9L5kATTXdj73TdytTNIjNLr4CuDR4XCB3lYNvu2tcYHoFoxq/9Cr9kyb12UTEMabSA4m
         ylrw==
X-Gm-Message-State: AOAM533WLKVTuZeki+BUk9/nsEV/d37jITkyWS3Sa6jGYn54TZ8Hcr4Y
        DSkTfk8qBaqZ7DSB1AzmRHs=
X-Google-Smtp-Source: ABdhPJwUjnQtYfBSRZofXE9oBppoQQtaSpPVIs5rOwAZ3t08Ng6GXIryv2910zKGRmpg2sAiqE0KfA==
X-Received: by 2002:ae9:ebd2:: with SMTP id b201mr2353660qkg.409.1592464281066;
        Thu, 18 Jun 2020 00:11:21 -0700 (PDT)
Received: from ?IPv6:2601:152:4104:430:3800:8361:8699:4c18? ([2601:152:4104:430:3800:8361:8699:4c18])
        by smtp.gmail.com with ESMTPSA id c17sm2316416qtw.48.2020.06.18.00.11.20
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 18 Jun 2020 00:11:20 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: penguin (was Re: Linux-mac68k project account maintenance)
From:   Josh Juran <jjuran@gmail.com>
In-Reply-To: <alpine.LNX.2.22.394.2006151336260.34@nippy.intranet>
Date:   Thu, 18 Jun 2020 03:11:28 -0400
Cc:     linux-m68k@lists.linux-m68k.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <7A36365D-870D-46A2-9091-051074465693@gmail.com>
References: <alpine.LNX.2.22.394.2006151113030.17@nippy.intranet> <0A4C54D6-956E-4E46-90DB-BA89B0ED66EB@gmail.com> <alpine.LNX.2.22.394.2006151336260.34@nippy.intranet>
To:     Finn Thain <fthain@telegraphics.com.au>
X-Mailer: Apple Mail (2.1878.6)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jun 15, 2020, at 12:21 AM, Finn Thain <fthain@telegraphics.com.au> =
wrote:

> On Sun, 14 Jun 2020, Josh Juran wrote:
>=20
>> As my most recent participation was co-developing Penguin, I probably=20=

>> don't need to be an admin. :-)
>=20
> If your sourceforge account is still a going concern I'll leave the =
commit=20
> bit as-is -- I'd hate to discourage possible future contributions!

Very well, I just changed the password and replaced the SSH keys.  I =
didn't enable external email, though.

>> I'd also be interested in any hearing about efforts to virtualize Mac =
OS=20
>> or Mac applications on Linux/m68k, as I might be able to assist with=20=

>> those.
>=20
> I don't know of any MacOS virtualization efforts (kvm for linux-m68k?)

I've made a small first step -- my emulator runs Mac applications in =
User mode.

> Personally, I'd love to see EMILE ported to MacRelix, as a replacement =
for=20
> Penguin.

Okay, /that/ I wasn't expecting. :-)

Though now that I think about it, I can see the appeal.  The booter =
itself becomes a command-line-only program, whose resource fork can be =
empty.  You even get a rudimentary shell, a couple of scripting =
languages, and some filesystem-bound GUI primitives.

And while MacRelix may be bloated by 1990 standards, you're not trying =
to boot Linux on a 4 MiB machine.[1]  (Plus, whatever RAM it uses you =
get back after booting Linux.)

> Reason being, there are several Penguin bugs that result in boot=20
> crashes and some other bugs besides.

I got my start here fixing general Mac programming bugs in Penguin, and =
if any have crept back in I can certainly take a look.  I've also got a =
solid background in 68K machine-level programming now.

> Almost all have workarounds, but you=20
> have to read the docs to find out about them (and go out of your way =
to=20
> apply them).

Is Penguin still built with a non-free compiler in a non-free OS?  A =
port to Retro68 might help make it more maintainable.

Josh

[1] ... I hope. :-)

