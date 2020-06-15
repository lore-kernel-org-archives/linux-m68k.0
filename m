Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C19C433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 03:29:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42F802078A
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 03:29:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vPcJrVRi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgFOD3M (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 14 Jun 2020 23:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbgFOD3L (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 14 Jun 2020 23:29:11 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CF4C061A0E
        for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Jun 2020 20:29:11 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id j32so11536615qte.10
        for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Jun 2020 20:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=C6a+iGaEfuBHCNRudMiimqTW3PBwyjj3PZZTjNl166U=;
        b=vPcJrVRiPGUf7NnZi7eB7+EiBDJpMbLoIs+IjyVf3+UulqRK7ZNicVqKgsX7hGBE1w
         GZxj8DGDjt1OhP3wKFzBxuKimuNouq8YNGOP4Ku5Sjj0TX85zvfwjDzZwF+hda57Fe2W
         KuUvDHr+X520/shbUNY9Hv6HRJEvMNgm4+8VeYxrSRAV5n5PUk+cqSsF9qQyc3hzSMy8
         069xD0s1/oS5aKsD3MDBvAecA0yiIOteG9Ajm0O0sufT954ffUVgOwhbz3QMkoLnUBLq
         u5CC41TdwJYXxE2URqvkCvqolNOmnKAIvnuL/yy2RM3I8t0MHsjgPAliJAKc2gA9IA+i
         V+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=C6a+iGaEfuBHCNRudMiimqTW3PBwyjj3PZZTjNl166U=;
        b=ndW/IavOk3aj1UiJiERCq4sSWBolxjOzE/IyGRJEBm7/OIHijPRt637PN7/INseTYS
         CzbkGVj7SviWuOW2q0ekg74InzS7UriGZNr/ui1wREjtxj7PQZK4ffCmGIwlxskn85vE
         NpRzS/Ggy+Qqsg3AYcsVOEVvKgXdi7PtK8Hy6ExasC0tj7dF4j0uM9wEqub9VQ5N8j/4
         wz7O3T6m2SSLo5A61iVISjZrAdqkFdBy9xAhVAXJwt/b1+wCHbEQbxwzdFQjH0PinUGM
         jTLpInuUwbQzsV2T2mxgxMX8m603Ar4fYVd/a6vRLYINSb2AF4doF9yLjs9cVnydA8rn
         p5Cw==
X-Gm-Message-State: AOAM533mBgQ5cAs/ljOu6V2stqzFvmuu/u1lxJakueJMmy1Br0AGh1Px
        CZBS47+lXuQJ2tWoUNRbnNw=
X-Google-Smtp-Source: ABdhPJw+M6VgZP6T+SwUZF7RWJPHWUA1CC/dkbA5iTploJbtk81MZR7in203TkPXtUaxgC6SE7/k/w==
X-Received: by 2002:ac8:664a:: with SMTP id j10mr13166695qtp.85.1592191748262;
        Sun, 14 Jun 2020 20:29:08 -0700 (PDT)
Received: from ?IPv6:2601:152:4104:430:6138:7e10:c739:a845? ([2601:152:4104:430:6138:7e10:c739:a845])
        by smtp.gmail.com with ESMTPSA id k26sm11790384qtk.55.2020.06.14.20.29.07
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 14 Jun 2020 20:29:07 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: Linux-mac68k project account maintenance (fwd)
From:   Josh Juran <jjuran@gmail.com>
In-Reply-To: <alpine.LNX.2.22.394.2006151113030.17@nippy.intranet>
Date:   Sun, 14 Jun 2020 23:29:07 -0400
Cc:     linux-m68k@lists.linux-m68k.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0A4C54D6-956E-4E46-90DB-BA89B0ED66EB@gmail.com>
References: <alpine.LNX.2.22.394.2006151113030.17@nippy.intranet>
To:     Finn Thain <fthain@telegraphics.com.au>
X-Mailer: Apple Mail (2.1878.6)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jun 14, 2020, at 9:15 PM, Finn Thain <fthain@telegraphics.com.au> =
wrote:

> When I send email to <jax@users.sourceforge.net> it bounces...

I haven't tried to log into SourceForge in a long time, and I have no =
idea what still works.  Please use jjuran@gmail.com for future emails.

> jax is still listed as a project admin.

As my most recent participation was co-developing Penguin, I probably =
don't need to be an admin. :-)

Let me know if there's any other information or action you need from me. =
 I'd also be interested in any hearing about efforts to virtualize Mac =
OS or Mac applications on Linux/m68k, as I might be able to assist with =
those.

Thanks for reaching out!

Josh

