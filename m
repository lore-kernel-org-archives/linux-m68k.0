Return-Path: <SRS0=e+th=4R=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEE9C3F2C6
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Feb 2020 12:47:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 944FD24699
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Feb 2020 12:47:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMnUlQH+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbgB2MrZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Feb 2020 07:47:25 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35026 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbgB2MrZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 29 Feb 2020 07:47:25 -0500
Received: by mail-pg1-f194.google.com with SMTP id 7so2982501pgr.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 29 Feb 2020 04:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SopHgag1pHRfgqo6jYYDVdibI0BsDkhh6n0baQEH80Q=;
        b=BMnUlQH+Ck7o6kbIr5J31hlHOJPx/5DWj3MLyrLNMEkJ7qHn1PAJJuBpZDqEBj1GI0
         yaqeZpfDBJwAu9ikxZNc5dZsAwPCNUmg7Csux0+DuSbo/p53A13/RamhXHtLJiL9zrK4
         Gg2fSp9URra/JzVi32eeB+wK1/6tfUAtFk5LSF5rUn6Coa6LeCWwW2oImCn4FH9O88bw
         0urQXgmXSWGGZRUG/OSEB3ZYU9Jh4oRj0oc8uFouhz22htuqMrKA6RKfXDq/K/C6HwtX
         m8UZ6VJeydIkx5HCguFoMbfYnnjeVM5VR8BLg21HQBNpaEDU1s5zTdmy39xEKbDzZV2+
         fZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SopHgag1pHRfgqo6jYYDVdibI0BsDkhh6n0baQEH80Q=;
        b=V5JvUOsUlQGjnWU/yf3cvdicYe7dl8XWvW22AWmFJyUhGEXJVOiBn5f6VcbpdA6OBN
         1WsxFYNr+4vIQZcuVVTnxs2ugykTtKIq+atkeB5sPmPQd0FhiGRqUwCfRxfowtTSpGRg
         5ZcnRY2z4EhiN6rOZ6H1Z4Utt81FGta0mKY6t/x0wwNOmLWNX9pyRKFGVawFexe6TUIw
         Uqfz3Nsx5ttzPF8mke53l1XbTtpkNjWlQ6PMeSQT3aNdRFRVSssjPPYAM44t8w+sSLQh
         G5FvO+XhifOtpW5wlhAmxLw1w1q4phBYquU1Z4LOLBm0ajzU8FybysuFKZYO75dDGRC3
         3Yfw==
X-Gm-Message-State: APjAAAWEIyfdJcF7gAKihRTQSZwzJrjd57NCO+DyBEEaJ7Y8tQG9KFIx
        CJjdZkTS2RZzL9M3FmL/BuY=
X-Google-Smtp-Source: APXvYqy+2oIvqB/ZpX0bJVG7HxpyUD0nsx6cVEye04I49AOyE9gHDSOIvyfb4H/57t/N5kny6Bj3kQ==
X-Received: by 2002:a63:f20a:: with SMTP id v10mr9411281pgh.420.1582980444279;
        Sat, 29 Feb 2020 04:47:24 -0800 (PST)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id q7sm415364pfs.17.2020.02.29.04.47.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Feb 2020 04:47:23 -0800 (PST)
Date:   Sat, 29 Feb 2020 18:17:22 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Finn Thain <fthain@telegraphics.com.au>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 06/18] m68k: Replace setup_irq() by request_irq()
Message-ID: <20200229124722.GB27151@afzalpc>
References: <20200227081805.GA5746@afzalpc>
 <2c8b836e-36f7-e479-db7a-6bb3c072116a@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c8b836e-36f7-e479-db7a-6bb3c072116a@linux-m68k.org>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Fri, Feb 28, 2020 at 05:05:36PM +1000, Greg Ungerer wrote:
> On 27/2/20 6:18 pm, afzal mohammed wrote:
> > On Wed, Feb 26, 2020 at 10:26:55PM +1000, Greg Ungerer wrote:

> > > A quick grep shows
> > > that "%s: request_irq() failed\n" has no other exact matches in the current
> > > kernel source.
> > 
> > git grep -n '%s: request_irq' gives a few somewhat similar ones, i
> > remember it because searching this string after my changes to verify
> > gave more than that i added :)
> 
> Unfortunately similar strings won't be coalesced...

Yes, sorry for that irrelevant comment, i didn't notice the context of
string coalescing w.r.t which you made that comment, my only excuse is
that i was drained by the end of writing that mail.

Regards
afzal
