Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CECC05027
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Jan 2023 16:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjATQhf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Jan 2023 11:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjATQhe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Jan 2023 11:37:34 -0500
X-Greylist: delayed 655 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 20 Jan 2023 08:37:06 PST
Received: from tiger.tulip.relay.mailchannels.net (tiger.tulip.relay.mailchannels.net [23.83.218.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D2D71BC4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Jan 2023 08:37:05 -0800 (PST)
X-Sender-Id: dreamhost|x-authsender|alex@alexperez.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 456007E158A;
        Fri, 20 Jan 2023 16:18:23 +0000 (UTC)
Received: from pdx1-sub0-mail-a268.dreamhost.com (unknown [127.0.0.6])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id B2C257E149E;
        Fri, 20 Jan 2023 16:18:22 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1674231502; a=rsa-sha256;
        cv=none;
        b=7HVxbBJO6uC+mos/SIQHv790u4jUpbvp6ORP/CSFk+2y4yqvXrD1GYiVBGjRZQoyRM8EyC
        Xoe35X70lp4eXKiUkzNTUXOJV3fufjxnwAdHq6tyAxP6//ffwT9NAiA6F/I3GIxO+S8yO9
        WzJO6iKdCz3ayMAx2QkMOPXz8YSZDgcPAdD+0VfCih3HvxXMIKG7Ok5soEkD0B8GuAwnRn
        yvpe5X0vHC9L/RFPNPfKxb4jStXjwMK/n0yA2Xe8sIKwUXEFwL+r8krRzIXQ0XRNZK2sB+
        K6d3mYrTW27LrIeEjXqOCgyrVpJv9Kp0rbryWwedM4tIVz47V+ApTy5VrIE3lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
        s=arc-2022; t=1674231502;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:dkim-signature:autocrypt:autocrypt;
        bh=FG7Qa7rf7tI4CObYo3JVFkvQdAyEvYqUF5FfSgFN6Wo=;
        b=8wC1imb5y1kVIdgQRYpicfszmF85Icv+Fp3soBStqUJ1Op/EsTmA6MrBIhjYJ6QMZj9ZbO
        Ha63zMUj1w6dy/u79uJTElcb5EbW/2yr4UpwHi55ZZeJTHHqndR2XELLGXC76IO4SUkq0V
        CtGkWBi0cnxYW0PaikkPKTphlTyZvJYRIOFPDwm3sIexyF1DvvtJXZNsmGSvIoGTaHewGB
        xeI8oXMF4JHjPJYRXckqOOpOCNEMvFemKH4uIMSjXaACgg1ibWZH0GXjQ/ZDpw0mIo1fHw
        pl5ohX25wKRvI6/xaWjGTTrUHilPi+9mNxI+fgB9JMlYdlEK4LAlW5NnylmJbA==
ARC-Authentication-Results: i=1;
        rspamd-6f569fcb69-cftxt;
        auth=pass smtp.auth=dreamhost smtp.mailfrom=aperez@alexperez.com
X-Sender-Id: dreamhost|x-authsender|alex@alexperez.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|alex@alexperez.com
X-MailChannels-Auth-Id: dreamhost
X-Broad-Shelf: 3adcf6ae7e61ed3b_1674231502996_1105639039
X-MC-Loop-Signature: 1674231502996:3799279529
X-MC-Ingress-Time: 1674231502995
Received: from pdx1-sub0-mail-a268.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
        by 100.99.229.6 (trex/6.7.1);
        Fri, 20 Jan 2023 16:18:22 +0000
Received: from aperez1-mn1.linkedin.biz (unknown [216.52.21.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: alex@alexperez.com)
        by pdx1-sub0-mail-a268.dreamhost.com (Postfix) with ESMTPSA id 4Nz4Rf2S9sz3Q;
        Fri, 20 Jan 2023 08:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alexperez.com;
        s=dreamhost; t=1674231502;
        bh=FG7Qa7rf7tI4CObYo3JVFkvQdAyEvYqUF5FfSgFN6Wo=;
        h=Subject:To:Cc:From:Date:Content-Type:Content-Transfer-Encoding;
        b=aMpcucPmY0epzpFkwYbmakKoFO+Ktzn5VIIyYIHCaKlh5meL1tkmylDepxx4X34I4
         YNxN3s5JQyfI/bfM8S098dSice9sB32sj6XUN05hYifxe3T1yybVVHXOTAWIqObx2Y
         p4gtsoAELWjG32ZlAHgbOeTDEVHhuRMAeWkilHUViYZbjOAv6FMWumuPLkbUOBOVDN
         wES75yeCqyqhnNdcbIPsObSYKdg8J8Qzgq/7p9PC6PyvyrFvIOf57SLVJ+5NpSnJsz
         YASQ7IdkdsOR/SYP9wt/2rsz0aBaw9YuSQpnpI5Zt3UmAPIdfdk5gkJ9ovZTglJ262
         3YIV7JIMLMKhg==
Subject: Re: LLVM buildbot for m68k backend has been moved to production
To:     noloader@gmail.com
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Min-Yih Hsu <minyihh@uci.edu>
References: <40e8c60c-396d-0cde-d702-ab44f53bd26f@physik.fu-berlin.de>
 <CAH8yC8=gjpi6+weBkmfGaJtPXBRcLUh78mDcnYMiVaF9ULGHcw@mail.gmail.com>
From:   Alex Perez <aperez@alexperez.com>
Autocrypt: addr=aperez@alexperez.com; keydata=
 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
Message-ID: <b2b012c6-ec85-072d-6397-57c895defcdf@alexperez.com>
Date:   Fri, 20 Jan 2023 08:18:20 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:52.0)
 Gecko/20100101 PostboxApp/7.0.59
MIME-Version: 1.0
In-Reply-To: <CAH8yC8=gjpi6+weBkmfGaJtPXBRcLUh78mDcnYMiVaF9ULGHcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Fantastic, great job, Adrian!

Jeffrey Walton wrote on 1/20/23 6:17 AM:
> On Fri, Jan 20, 2023 at 5:51 AM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
>> For a number of weeks, the LLVM buildbot which cross-compiles the M68K backend
>> has been "green", i.e. builds and testsuite have passed without problems [1].
>>
>> As a consequence, I have asked the admin of the LLVM buildbot master server to
>> move our buildbot from staging to production. After receiving approval yesterday,
>> I moved the buildbot to production now [2].
>>
>> Another step forward in maturing the M68K backend in LLVM. More news on the backend
>> coming soon, I'm preparing a longer report.
> Good job, Adrian.
>
> Jeff
>

