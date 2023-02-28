Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC182C64ED6
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Feb 2023 19:37:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjB1ThM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Feb 2023 14:37:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjB1ThL (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 28 Feb 2023 14:37:11 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20386268C
        for <linux-m68k@vger.kernel.org>; Tue, 28 Feb 2023 11:37:10 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so10308579pjg.4
        for <linux-m68k@vger.kernel.org>; Tue, 28 Feb 2023 11:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677613029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2mZD14GxqUCJu2rkCKuReUJwLw4M/zUJGqr+Xv3Edbg=;
        b=PQUb4CmJnIuRpJhc2QXji1ZPs+otJ/WKklbFAao1o78DlmV/QWCPQU6qq4p1eCPal5
         3RQGya9H1/9VieGD+AeR+42TgTyP+n6nx2o+0CnkjbyCFNvzWpzxTBXbPa9jwFVN4LhH
         uNKTV8y8QZ2AaJX+bE/iuD4rFhO/ROSpk/FXjKm5g7VAsn3/9V5kHePXg1cRZhhdNPB4
         0Mv7wtEVSu69a5ITDR4gzqI1TFghtWKzXJ7dkzfAzyOx66+EiJmXh9tGenjYljvVx2yD
         2jNvsmHVYHEan8eJvapnXgz83Vig+EcWOi65fSPVv3o4JZaQjJKXIPBv6faN2BVDtm+S
         /Z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677613029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2mZD14GxqUCJu2rkCKuReUJwLw4M/zUJGqr+Xv3Edbg=;
        b=oZYyrfdmFCPPjTxa7TXAZ/I7jOiVWWFyPYpyqH1DuMw+7BzFMDVpdnRpTuLR15UaGj
         ZKE4o8VgnlFlDWdBKYXrDXMUO1sxuJVBHK6IJ+qMLnLIdBMfMUixaZX89wAjsIuOESx1
         T0Vejy8OxPJEKrf8804Qm4LGYHgISgLaDanw6U0M5xuyJ5EAK+g69gZWEqVIyUj+otpl
         cSAFrpxRqoWlebIq7CB4N0oOMdNLwwk4bJSWp4gqNsfo5wlnkV8D8DpHL81WUoTlEUsa
         3Q+UIbnO6CMRQ+jUKKsEubV72hXzze9t17jGYQ6ZE8nWPrih60fVBxtUxN5793J5Q+sV
         68Ew==
X-Gm-Message-State: AO0yUKWmcvfpm8xn36vlqPAXXSMnxcDYUiUQgz5l6xh5SN92G0bdTU7G
        RuiXFANyRUBE5ky4t/RPE4LyWzpk79RrpA==
X-Google-Smtp-Source: AK7set8IC56wDJqnNKXPkUB41PYvWvYfFh7sqb67W2eeqYA5RGhR/vosk2Kc3u3FsLFRO8FE3z+8Uw==
X-Received: by 2002:a17:902:ab49:b0:19c:e440:924c with SMTP id ij9-20020a170902ab4900b0019ce440924cmr3451612plb.47.1677613029401;
        Tue, 28 Feb 2023 11:37:09 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:112f:75e9:7ff2:6774? ([2001:df0:0:200c:112f:75e9:7ff2:6774])
        by smtp.gmail.com with ESMTPSA id c24-20020a170902d91800b0019c2d664869sm6825033plz.298.2023.02.28.11.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 11:37:08 -0800 (PST)
Message-ID: <d7b2a366-8627-aa57-e4a5-fc9c93bf7b16@gmail.com>
Date:   Wed, 1 Mar 2023 08:37:04 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC v1] m68k: kernel/traps.c - only force 030 bus error if
 PC not in exception table
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org, Eero Tamminen <oak@helsinkinet.fi>,
        Finn Thain <ftain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>
References: <20230222195021.6683-1-schmitzmic@gmail.com>
 <CAMuHMdWm9yJaHGF-EGVmn69iKXLAh3G9PZer6WJUi-ZJPHDRJQ@mail.gmail.com>
 <f716ab75-1523-db03-1615-41ec1b9ae6cf@gmail.com>
 <CAMuHMdW+fsDdOAr=zBuf0k=zO=FEfjFhHsMPbd6inOk=8DFS2g@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdW+fsDdOAr=zBuf0k=zO=FEfjFhHsMPbd6inOk=8DFS2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 28/02/23 21:08, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Tue, Feb 28, 2023 at 12:28 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 28/02/23 09:19, Geert Uytterhoeven wrote:
>>> On Wed, Feb 22, 2023 at 8:52 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>>> Link: https://lore.kernel.org/r/daca2f68-19fa-a2b6-97c6-16b5b7e26afe@helsinkinet.fi
>>> 404
>>>
>>> I assume that a message from debian-68k?
>> No, oddly enough that is a message that I have received with CC to
>> linux-m68k (but not from vger!). And mail-archive.com has it:
>>
>> https://www.mail-archive.com/linux-m68k@vger.kernel.org/msg13081.html
>>
>> And also on marc.info:
>>
>> https://marc.info/?l=linux-m68k&m=155477039405576&w=2
> That one has a different Message-ID:
> alpine.LNX.2.21.1904141327340.130@nippy.intranet
I get alpine.LNX.2.21.1904091023540.25@nippy.intranet ...
>
>> Later one with an experimental patch of mine:
>>
>> https://marc.info/?l=linux-m68k&m=155494864731013&w=2

63130691-1984-c423-c1f2-73bfd8d3dcd3@gmail.com

>>
>> None of these messages show up on a search of lore...
> Indeed, and I did receive them through vger.
>
>> What source do you prefer - marc.info or mail-archive.com?
> Let's keep the lore link with the actual Message-ID.
> Missing emails on lore can be backfilled later...
>
> Upon closer look, this predates lore collecting emails, so perhaps
> something went wrong while importing my old archives I sent
> to kernel.org. To be investigated...

OK - I'll send around v2 with lore links and comment removed later.

Cheers,

     Michael

>
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
