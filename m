Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52B0C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Feb 2022 18:06:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237402AbiBPSGV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Feb 2022 13:06:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237393AbiBPSGU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Feb 2022 13:06:20 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB912F4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Feb 2022 10:06:05 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id a11-20020a17090a740b00b001b8b506c42fso7211476pjg.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Feb 2022 10:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TB0RP7hxQ43ornq1kM04HtZL0Lnqw5UvvxmmECVedrc=;
        b=fVIBW32ER/VmK0gvJwC95WzdHWh7hqwqWMHN1CSkUJDRXDcHEypOvdSoLXku5Y8ld/
         Gp5GnV79B9W33DL8i85L2VIOubZUcrm6zlYgmwc3pV33JaCprNa+fNKGP82gzZjaxrTW
         WUj05BWswhOvDLcAkxnGnuXD/uAIz2MlLheRdm8lNpKAHbTjCG73QXkfXbWvB2g8yRpN
         kZzM0wAtNZH+tXLSltADM0FvUTL1P38IL5AKYfj9sZP1Xl9KxXX6q2WQvDks5bLbRnZw
         f9Mw+7MlvhnkE8HTWtun4YukNuPCUP/E4MQuC5hbxwFtQeAf98mnDLaEbEZWcPSjg86D
         frgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TB0RP7hxQ43ornq1kM04HtZL0Lnqw5UvvxmmECVedrc=;
        b=DT6CdHXjUbP6snqnkW0U5efJ0y1QUuLKFaE5gcPTfTu4TM9k6qWjZuzlgfLpoYEHVg
         g7nsDDi63HG1zbVBhFyT8AaVCjgaZ9bHhUW2vMOiejO8Xvvbiqb+aAEXrn8fdGGTwoi3
         uvYrgADW+lUO3qDT1P3C4YANQ46UJgKCVm123ZHvf1XDTaknnnr4ZqFwxqYdAZFjtCMY
         0jJZqgnn4YXq+2JG6BsFVAYeTpUCgRr4YTTgHXJfA1XsYifQUypth9Tt33GpeIXXFyTd
         SNtn36OXBF7CbdNeYjbg2lJPM6dPV8IDPxMcIGt50jIiDqLTdEa3UwYIUE6YEroIbfu/
         psRw==
X-Gm-Message-State: AOAM533wiQcmu+aZgivReNulFXoyUxHFuaxDU91ew4tfxqaNuRuVzTRk
        B4ka4nm5ktYaHAdQ/CfUf+A=
X-Google-Smtp-Source: ABdhPJy3HjoTriq6P8U+GeqXuBUnqV7Q/pj29Lsn6BbOS6sRQJ4S3WmHc1Q+RWMYzRjprpQ5dTg+5A==
X-Received: by 2002:a17:90a:588c:b0:1b9:d80e:e397 with SMTP id j12-20020a17090a588c00b001b9d80ee397mr3075401pji.237.1645034765034;
        Wed, 16 Feb 2022 10:06:05 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:f91c:f90:fcdb:e008? ([2001:df0:0:200c:f91c:f90:fcdb:e008])
        by smtp.gmail.com with ESMTPSA id s48sm3755756pfw.111.2022.02.16.10.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 10:06:04 -0800 (PST)
Message-ID: <e150da65-d239-54e8-b637-98d5354cbc64@gmail.com>
Date:   Thu, 17 Feb 2022 07:05:59 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Wrong colors on ARAnyM
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Petr Stehlik <pstehlik@sophics.cz>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <CAMuHMdU3ievhXxKR_xi_v3aumnYW7UNUO6qMdhgfyWTyVSsCkQ@mail.gmail.com>
 <b03160b6-7f3b-7765-49ee-c49b7dd2c4e0@gmail.com>
 <CAMuHMdVUX0zJtRAtjCBAa7iEk7MwCjcmSsJdCrSrPcY=6ti=cQ@mail.gmail.com>
 <4b3a0bc8-24a1-2a33-19bb-fbae954c614c@gmail.com>
 <CAMuHMdWkxDMbS4D8wkEPAVgrFnoJzejUkxKCnvA+MA38vS6g9Q@mail.gmail.com>
 <baf33986-d02e-35e8-7381-a30e28089a0a@gmail.com>
 <CAMuHMdWZ+H5kJyOUQWW49EGUemUe7qERuLaMWFOs0N8nNbuMTQ@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdWZ+H5kJyOUQWW49EGUemUe7qERuLaMWFOs0N8nNbuMTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 16/02/22 21:24, Geert Uytterhoeven wrote:
>
>> The atafb driver references a 'linux/tools/hardware.txt' file for a
>> description of the Videl registers. Does anyone still have a copy of
>> that file?
> At least full-history-linux doesn't have it.
Might be a reference to the old FTP archive at Erlangen then ...
>> Failing that - how would I go about setting specific text colours for
>> the console (or draw a test pattern showing the result of the four
>> palette entries)?
> I typically use fbtest for that.
One more reason to hunt for that in the dino age package archives :-)
>
> I also have a script to show the 16 colors (assumed there are 16):
>
> #!/bin/bash
> printf "\e[7m"
> printf "\e[30m                    BLACK                     \n"
> printf "\e[31m                    RED                       \n"
> printf "\e[32m                    GREEN                     \n"
> printf "\e[33m                    YELLOW                    \n"
> printf "\e[34m                    BLUE                      \n"
> printf "\e[35m                    MAGENTA                   \n"
> printf "\e[36m                    CYAN                      \n"
> printf "\e[37m                    WHITE                     \n"
> printf "\e[1m"
> printf "\e[30m                    BLACK                     \n"
> printf "\e[31m                    RED                       \n"
> printf "\e[32m                    GREEN                     \n"
> printf "\e[33m                    YELLOW                    \n"
> printf "\e[34m                    BLUE                      \n"
> printf "\e[35m                    MAGENTA                   \n"
> printf "\e[36m                    CYAN                      \n"
> printf "\e[37m                    WHITE                     \n"
> printf "\e[0m"
>
Thanks, that ought to do - I vaguely remembered there should be control 
sequences to set colour (having worked on VT100 and VT2xx emulators, 
though not the actual hardware terminals) but wasn't too sure.

Cheers,

     Michael


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
