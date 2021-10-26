Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2A1C433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 18:31:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D93461078
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 18:31:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236135AbhJZSd2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 14:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbhJZSd1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 14:33:27 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31DDC061745
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 11:31:03 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o11so337024ljg.10
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 11:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OXguLh0WNHEKlfFuQvMTGTJ+7qrh6TUIs5KKrA5WmaA=;
        b=WoIY+3XdSLW9YQe7GBf/6F1NA6RHYjzIp8j60phOurkXAHlRC8TPVC0LXcErTJfae0
         NRbIOwv1z+NqQFeyKR8Nk7pF/rFqREGBipIUkO10+CJ+6xScbZ1KpkrW+cM8Zhz3Wrfu
         hpEoiclGT0yC4qAQrH2iTxrhuwIYk4UpPNbmnolvw4YEXdH5rZJpTkynDvIxx9YWpwN8
         nXRlBhH/6qQ/8sOfIIfbBSxylC81esVi3rtpGs0/cNdYHbPJ8DDe1jt6fzycHSZhU/ou
         LxnNyZGXctoRenoSIL+9HxmXDUhOs1zA+56xSstmnqRJ6RPoLvlGTeEcWpZB3M+3tBbI
         Ffzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OXguLh0WNHEKlfFuQvMTGTJ+7qrh6TUIs5KKrA5WmaA=;
        b=zwd5XBUwM7ms1M8OcSO4NHCn+2I+QkM3TGn0Nw/5maYj6+sjCiqBl2388tRmB/WA+Q
         EKoVnnYxMnSxMenGU6paXbNYgYgiyvqAGwjcr5KZJGdhRtQpIneT7ARTNjeozfzGrdwq
         OliHM5exivth8J/Y1sZlArRKDHirrKmILVrMZ6sEgLCDjxZm5OJUQ7Itb4P1cH7zbdzZ
         IW/1JDYlf1crFGjcdnNjclKHURjbQI8CKtI9rvJTg5EQyTBWQcVumYC97LVaBT88Br3Y
         Vl5/tn/1wFhqMMH3K/f1qiY4OKSTdWq7fxbwVj4WrtjKlKJpBAf226euQTItevEZ3AeZ
         yR3A==
X-Gm-Message-State: AOAM5339g1MeK/xtytgdo1dyC/SftKJ3puEB/efcuGfT50Kfheg9G0Sy
        PXqeWXP8txS8NSx8FEtcs0B9fiJSdGgt03PO93B/8g==
X-Google-Smtp-Source: ABdhPJwcHcUxMTqtPzF5w+8vub3atUhPoOQHVlp/Fute42ZIqRwtsKMfstBI1lw8sOTsX8J4z656SBaTKhpsyVvO11E=
X-Received: by 2002:a2e:9b0e:: with SMTP id u14mr27526325lji.247.1635273062045;
 Tue, 26 Oct 2021 11:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211026173822.502506-1-pasha.tatashin@soleen.com> <YXhHq52jDrU61V4E@casper.infradead.org>
In-Reply-To: <YXhHq52jDrU61V4E@casper.infradead.org>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 26 Oct 2021 14:30:25 -0400
Message-ID: <CA+CK2bBbGEJa4s7HtgQkG_tZmN66UaVcDRovgLz4q+a0VGSqZg@mail.gmail.com>
Subject: Re: [RFC 0/8] Hardening page _refcount
To:     Matthew Wilcox <willy@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        linux-m68k@lists.linux-m68k.org,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        william.kucharski@oracle.com,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        schmitzmic@gmail.com, Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Roman Gushchin <guro@fb.com>, songmuchun@bytedance.com,
        weixugc@google.com, Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Oct 26, 2021 at 2:24 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Oct 26, 2021 at 05:38:14PM +0000, Pasha Tatashin wrote:
> > It is hard to root cause _refcount problems, because they usually
> > manifest after the damage has occurred.  Yet, they can lead to
> > catastrophic failures such memory corruptions.
> >
> > Improve debugability by adding more checks that ensure that
> > page->_refcount never turns negative (i.e. double free does not
> > happen, or free after freeze etc).
> >
> > - Check for overflow and underflow right from the functions that
> >   modify _refcount
> > - Remove set_page_count(), so we do not unconditionally overwrite
> >   _refcount with an unrestrained value
> > - Trace return values in all functions that modify _refcount
>
> I think this is overkill.  Won't we get exactly the same protection
> by simply testing that page->_refcount == 0 in set_page_count()?
> Anything which triggers that BUG_ON would already be buggy because
> it can race with speculative gets.

We can't because set_page_count(v) is used for
1. changing _refcount form a current value to unconstrained v
2.  initialize _refcount from undefined state to v.

In this work we forbid the first case, and reduce the second case to
initialize only to 1.

Pasha
