Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8BDC433DB
	for <linux-m68k@archiver.kernel.org>; Fri, 15 Jan 2021 18:53:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17A022339E
	for <linux-m68k@archiver.kernel.org>; Fri, 15 Jan 2021 18:53:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbhAOSw5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 15 Jan 2021 13:52:57 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:43819 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728163AbhAOSw5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 15 Jan 2021 13:52:57 -0500
Received: by mail-ot1-f44.google.com with SMTP id q25so9502388otn.10
        for <linux-m68k@lists.linux-m68k.org>; Fri, 15 Jan 2021 10:52:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DvYlAeWej8u54Yv+LnlNu0YGIqAZTWhF0Jo3LcKy1N0=;
        b=syqucLftXcR1/h54cmU71XjNcT0S9FM+xF54U6A5HqvKNCLEc5Dbej29phm7ktGEkc
         cFOFtq1+pz66owK5f0vnuvRC5n27ACbforZxRuDUKIaGDDSPndWnGhpG5nkfmssVIxd7
         hW0gVoOFb02JAmTkDi0FfwahHWfsQrFlsiMyWQxDQSym9wdyIZHwD9A7PlZu/MatNl6E
         dH1axoNLBjXW4HGBwhrkYN8O9A7AWjpJUASQcZGqtAYDxeuprGN+gqmVdZHnP/mzxDIC
         siaYFjrS5A3hP/9cZC9fGbXAnYI7u98bxEX9EbZG5oylckVlqyZ6Cv6tlYTPZrmq+FpR
         UMDA==
X-Gm-Message-State: AOAM5301pJnZDrfXilQMCKZsMayIRNoiQ5FvzRxBXRuF7FQcBY4FIz2G
        jhj4sGGvUXEczV1cP3N3au9g+1enfDaIF6Htzv8=
X-Google-Smtp-Source: ABdhPJyRyoj1KQcVw2ds2krnqXNRSFrYFe/JoPgvMXxhG5K6PUfcL9/9raDetEahisPa467NJ2u/1lhZMIYBf/BX70k=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr9378982oth.250.1610736736543;
 Fri, 15 Jan 2021 10:52:16 -0800 (PST)
MIME-Version: 1.0
References: <9fd0f739-1b4b-6ce1-6a02-02375b4b574f@physik.fu-berlin.de>
In-Reply-To: <9fd0f739-1b4b-6ce1-6a02-02375b4b574f@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Jan 2021 19:52:05 +0100
Message-ID: <CAMuHMdW5Of5dJwVjBytZyuTw3fxv1vPXrTcB6EzLUVW6T3Jsbw@mail.gmail.com>
Subject: Re: Booting Linux on Sun3 machines
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Sam Creasey <sammy@sammy.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

CC sammy

On Fri, Jan 15, 2021 at 7:32 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> Since Arnd has waved with the axe at the Sun3 port this week, I would like to start
> testing the port to make sure it still boots and if not, we can fix the problems.
>
> I have three Sun3 machines in my basement that I can test the kernel on. However,
> I have zero experience booting these machines, so I was wondering whether anyone
> has booted Linux on these machines in the past and can tell me how that works.
>
> Thanks,
> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
