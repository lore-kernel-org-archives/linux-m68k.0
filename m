Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060EDC433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 17 Jan 2022 20:50:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbiAQUuE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Jan 2022 15:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbiAQUuD (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Jan 2022 15:50:03 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF39C061574
        for <linux-m68k@vger.kernel.org>; Mon, 17 Jan 2022 12:50:03 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id s15so5474398pgs.1
        for <linux-m68k@vger.kernel.org>; Mon, 17 Jan 2022 12:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=vRLC+mXEATCufXA1nSgIw5qEifpCkdUOEnfdm0/fPqk=;
        b=A7AkLzAmyYLdPAYrcCzOC0LXbh1T+lZ8OpPpPnuJq017zIvR6O44a+tRCgW5GLP2lz
         EEHeJXbp58x89vyaaWVOK2hkD1RQyuzgcUckAXbqu7HjF1wMV2sfzMZMYZ1cAjfEe9hQ
         K/qz2iKoMQabKYXTXg8BnUu53HhY6wpHHg5S8AOuor3Z0vKfZuk0CrHZYek6u45QMcCv
         9KKLAwKrEGhJUxquKQ9w+kV9zHS0QRrjnpQ9DB+rXGczMh2mIjrAKSE1y2xWV5tg0Vmh
         tpcnKXDdWCgpCdbyyl0JlO71bgNAfzoDMOFCSiuW9NCV6QZ0AkTzwK+/JLoVSk8OfXR1
         BDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=vRLC+mXEATCufXA1nSgIw5qEifpCkdUOEnfdm0/fPqk=;
        b=5d7GwSPiIv0FY1Jyp7ELMZDZhEOMHGuB0ZfgDxojjBWNpP6xpbenDES1fc/7j5LWSV
         58UqaIdn9KjrQ+vUDzw9t33N5i/Tb+MF8lIKpqFpIlbAaoXQCRjiIuW2OpeQGTomnl+U
         JspBqV2N2jeokBds2NS0grJBVmphSE7oTbrhCjmqSetLdNqd7C52g9jAIQtIg3G9mp0q
         xexjXDlyDdwF2I6JLH46dXe719nFZ631c2lTzS1SfMEGsPRR+yWdAqYujMBTWYeqZjfj
         /UPh6Nqh4X1FOR+P3r9GoApEjLQeAsvEfgizfw/jPrepPQKipZ0ShjdaTEtHI9MLDU9V
         7VTQ==
X-Gm-Message-State: AOAM530uFUnSb/Ys+qK5YI6C1KyPOPJ9omtVixy7hmgm6x72gOMqkcLX
        Ou0ILGpOFzbj6RHkew7e0No=
X-Google-Smtp-Source: ABdhPJxTew6WGUBUt4PFP6dKznvTDIBvbXbdBqSCFhjEeWj3h7Adkz4ChlWfPhcKe4KiLeW66m812Q==
X-Received: by 2002:a63:4554:: with SMTP id u20mr20362807pgk.463.1642452602738;
        Mon, 17 Jan 2022 12:50:02 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id j125sm499449pfg.190.2022.01.17.12.49.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jan 2022 12:50:02 -0800 (PST)
Subject: Re: [PATCH v8 0/3] Add kernel seccomp support for m68k
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@vger.kernel.org, geert@linux-m68k.org
References: <20220113010903.720-1-schmitzmic@gmail.com>
 <81cfe72d-1311-39fc-98c0-894189f3d229@physik.fu-berlin.de>
Cc:     ebiederm@xmission.com, viro@zeniv.linux.org.uk
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <ca3db176-df11-feb5-69eb-d77ff644308e@gmail.com>
Date:   Tue, 18 Jan 2022 09:49:57 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <81cfe72d-1311-39fc-98c0-894189f3d229@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

Am 15.01.2022 um 11:51 schrieb John Paul Adrian Glaubitz:
> Hi!
>
> On 1/13/22 02:09, Michael Schmitz wrote:
>> Respin of m68k kernel seccomp support, again.
>>
>> I have split the (MMU) m68k switch to syscall_trace_enter()/
>> syscall_trace_leave() patch from the patch adding return code
>> checks for syscall_trace_enter() as suggested by Al Viro.
>>
>> Patch 1 could now replace Eric's patch 'Stop open coding
>> ptrace_report_syscall'.
>>
>> Rest of the series remains unchanged.
>
> I will try to test this series within the next days. I'd like to see this
> finally getting merged as there is a number of packages in Debian that
> depend on libsecomp being available and there currently cannot be built
> on m68k.

Thanks - your tests might help convincing Geert (and explain why my 
selftests never showed much improvement - missing modules perhaps?).

Cheers,

	Michael


>
> Adrian
>
