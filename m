Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7E3C432BE
	for <linux-m68k@archiver.kernel.org>; Wed, 25 Aug 2021 22:59:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AACE610CD
	for <linux-m68k@archiver.kernel.org>; Wed, 25 Aug 2021 22:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232978AbhHYXAc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 25 Aug 2021 19:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232217AbhHYXAa (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 25 Aug 2021 19:00:30 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2881BC061757
        for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Aug 2021 15:59:44 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r19so1448781eds.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Aug 2021 15:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UR6MBIhoHQN1j8GhN8TVE2Qq6SzidLCqK6QAEskXj0A=;
        b=VWWys8kyJBTZsW4oNkWOpEjihSLbWgMTRn/s5eK0dq6ewYT22vcAcUw9H4ssgEMFcq
         dnrpH+M2jdBYQHk+V7QUU7c4LIqO3ENr3jRz1KxYaGzXsoBcn/+mKkq16BLZ51QcIujN
         YI4deCcJZEeEQBzaTF0Vst0wpiNPGXWLNnS5v9HJQ2y/M8DGHzB3aPwGZVm7rsKg8JUo
         N3+uld+pi8VXW0nnNJ2+MesKIX/svuXYLz0rjh198rICIY+ltHUK8y+LrADdiq+Z/3Mn
         GnB3T7W69wjHsujLFP91ytwxSXa4XzLeEEikTdpUKeOKJ/5Xvdoirr9x2yg7x+C3g4v+
         Wdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UR6MBIhoHQN1j8GhN8TVE2Qq6SzidLCqK6QAEskXj0A=;
        b=nU60CguLOSQUz686oPNgkObdCrTofOwhlCsBTNLOctRgSdRCtPQzDiWZqfbgXRLgjO
         0K+T8u1RaACvS6fzd768mGQpevIcb3OlMZNbq/t1hBMsZGae+01F39nR4sEgio/nEQSd
         jBCyYpueu9UtvV4EDzZJP1SargTtR+MU/8gSqDqlkLErQ2vPcXasYD9qk6oBjcKM8YfQ
         8HVqm851Uz5LzZOurUbO79qFGZP34HFmklWSfg54W+HMtpCmpn0eIihuRLJKFLl4dpxK
         NQZs5KZuaPzploR2e1fyzC3+o+nwvUTmJxEEA4FvZwF0uAV4kMXcQnvPXkNlmWAqXO55
         TGPg==
X-Gm-Message-State: AOAM53350X1/F5uxC21wfKQraqGazbOg9uNvxlHp30Zq1RM0DlWUkcNh
        jO9zGtLK1JrcITEQlM30roVQm+5WB3uulqoTroM=
X-Google-Smtp-Source: ABdhPJxw+16OORBWNOBVgl1IVT6SNmVcqtT1CkCqDznQkIt1Q8S49we/U4wZghAWGJ8Tdxt8/SeT6FO59fyejYiycsc=
X-Received: by 2002:aa7:d351:: with SMTP id m17mr956439edr.72.1629932382807;
 Wed, 25 Aug 2021 15:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
 <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com> <20210721170529.GA14550@lst.de>
 <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com> <20210723051126.GA31274@lst.de>
 <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com> <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
 <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com> <20210815074236.GA23777@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com> <20210816065851.GA26665@lst.de>
 <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com> <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
 <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com>
 <b211dea5-ec59-21db-4235-387d7983905c@gmail.com> <CAHk-=wib3p3rn+4YgS+dVVb=VciMGXJwGL-SiMY9QTytDMF08w@mail.gmail.com>
 <57501cee-de70-99e5-3a92-e5d2a515bb51@gmail.com> <87bl5n9q1e.fsf@igel.home>
 <208ad46d-e4ef-68e3-97d0-aa7756852a92@gmail.com> <878s0px6al.fsf@igel.home>
In-Reply-To: <878s0px6al.fsf@igel.home>
From:   Michael Schmitz <schmitzmic@gmail.com>
Date:   Thu, 26 Aug 2021 10:59:30 +1200
Message-ID: <CAOmrzkLSSUDXrN+NF+bbKNbj_u79ffkCERZ8cZ70=POfLQkM4Q@mail.gmail.com>
Subject: Re: RFC: remove set_fs for m68k
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Aug 25, 2021 at 8:44 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Aug 25 2021, Michael Schmitz wrote:
>
> > the manuals on the NXP web site don't have the exception frame format
> > tables,
>
> See 8.4 EXCEPTION STACK FRAME FORMATS.

Not in my copy of part 2 of the 030 manual. The section is there, the
pages that are marked 'Exception Stack Frame format' (pp 8-32, 8-33)
are there, but the pages are blank (except for header and footer).

Tried with acroread, xpdf and evince.

The original Programmer's Reference Manual has the frame formats in
section B.2 (without any explanation of the fields' meanings,
however).

Cheers,

    Michael

>
> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."
