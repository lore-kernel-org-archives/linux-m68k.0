Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7300C433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 09:47:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B35F52065F
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 09:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="PYNS1k61"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgFOJrN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 05:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728505AbgFOJrN (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Jun 2020 05:47:13 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 044F6C061A0E
        for <linux-m68k@vger.kernel.org>; Mon, 15 Jun 2020 02:47:13 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id y123so8966360vsb.6
        for <linux-m68k@vger.kernel.org>; Mon, 15 Jun 2020 02:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cs+nqZcCSpiIjVrhNu+xPaPEPCcm+f1E6a1kxm65KL8=;
        b=PYNS1k61Ogo1lJ0iqyCNC8ZqOQJOhyzlmJ17RhL08P1wsYG+ticTIC54eX+5t8FJJa
         9hXYESs8EZ8haMXe9aYmePU1x6aTjFvwXVNHDsXOyV5REN+Ww1WKLc7Ajtc2/VaiyufS
         nDXZtbHd6aPutXD9N11CMjTbb+OwpqtmJdpjUP+06A3xKGNkTv7AkUzwRi6J/a8eozKJ
         6C6B5//ZeI6OMT7KoBrtQJU9GolJBdNqj4P1KQYJLKIEj8WkkJT7zIA54/F8lR16n+AE
         nVa8WuopUmjdvTBA1HKjrALfNPgP96wU9p45/W6R2SCV7tuA+cCwF4WNBwmkTVM6m56c
         xbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cs+nqZcCSpiIjVrhNu+xPaPEPCcm+f1E6a1kxm65KL8=;
        b=kz4OSs83MqZMeqWZEBxLsanA4xFoaPcyP4zCBqXL2NmfB5DPmGbIdM7IpwfbKPYBxJ
         vMb4VMXqfX3WKc+AOSUP/u0UPO7NXzRcPXfP8kd1E0sCkhCGplg1MVSiMBb/cBgu9JQw
         B9t/67NThhxnT70HCJWOCBV3HWSQFfdd/UQr64Mjwvh0niV8D9WveZDUQJaby5ymmhyl
         8YowltD3QkQofmtRuKuiCq1cBWzCpRZ5v+4d1AFN6j9rhObVgVnSLe/zGThZCmZSoIuC
         WCwUII7CSKvUaR6eSDU0ng6bgZUNOmeGZB0ckkzXnXnTxn6FhcjCNuxGMxwT4fktsg1X
         tCHw==
X-Gm-Message-State: AOAM530dBj13Ug69PkwZSz6rJ/bhYig2HffhAGyAPo+iPjmXDEFjoceg
        EzUK8RT5jksQeVkOhpVjZWxc29U+T9gI5Psfh2L9rQ==
X-Google-Smtp-Source: ABdhPJwvk3rl0YwkheOhMFmUEfH0uvxhTEqCkkkdFJl0sA4zKxG0DmmfcD5vH8Ebwqqb66BmqHnz+RbaSa4Odq7XRWA=
X-Received: by 2002:a67:885:: with SMTP id 127mr95504vsi.182.1592214432219;
 Mon, 15 Jun 2020 02:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200607191215.2626739-1-angelo.dureghello@timesys.com> <1e8c2220-b0db-0bd0-856c-dd560a4ad01c@linux-m68k.org>
In-Reply-To: <1e8c2220-b0db-0bd0-856c-dd560a4ad01c@linux-m68k.org>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Mon, 15 Jun 2020 11:53:12 +0200
Message-ID: <CALJHbkBq0_CZagXQf9vOM-9L5D5tn_jMM4bCERGcdwYvvpWPTQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: stmark2: defconfig updates
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Sat, Jun 13, 2020 at 9:07 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
>
> Hi Angelo,
>
> On 8/6/20 5:12 am, Angelo Dureghello wrote:
> > Some defconfig updates for stmark2 board, mainly to enable
> > sdcard and mmu.
> >
> > Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
>
> Will apply to the m68knommu git tree, for-next branch, after the
> current merge window closes. Should show up there early next week
>
> Regards
> Greg
>
thanks !!

Regards,
angelo
