Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A89C636CC
	for <linux-m68k@archiver.kernel.org>; Sun,  5 Feb 2023 22:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjBEWTq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 5 Feb 2023 17:19:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjBEWTq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 5 Feb 2023 17:19:46 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B1B1B55B
        for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Feb 2023 14:19:45 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id g13so5533892ple.10
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Feb 2023 14:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kLtr1yqIgBqJILQiCDXyTDTpH2XSokqrR6Sa8bfg+Q=;
        b=aKFshuvMJS/eyqngYS7ReCBlNaNctmU85Alg+2e1l6lmho+M7olmoBdRlpt9BT/cYi
         6HNIxWF1hxZyzlzKqbLt9kMCce+0/YvjA9JUHc/qQ/srFvQk1JiuOxF4vmsdlOBVDqsG
         3HRoyCPGPqhqQg6rOWHfW83rEoa2uBHcTiDQh/9zdwT+DbhikAKcSIQ+1HEvX68MVbpI
         cIzyQDZIcjjmtX1GbbNzPtlM95NUjyT/3CV2K+HPw9x9/vCBIuqv28k4YRCOnb/OrNE9
         sI5Pn+rKKSTMagDhOiIz1fsQhi6xX/WNMRra64JVxFZ95mkv0FXcjCicHdbcc1i5UXHd
         oF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9kLtr1yqIgBqJILQiCDXyTDTpH2XSokqrR6Sa8bfg+Q=;
        b=SPEYF5uI1qpjkRcjHwkb2lE51FBsRQvg1osuSwbeMeILhbxHV6jwKCfLaWbHeRDrF4
         1nM8Kt+tQZddX9kHLqDlfVOoBFk9DDc2Dy0C2+WhpEImK7szroems49ePfDKzv7HOLV4
         9mq/MrNyuLn9CfHtjiutFr0QwCzdWgkd8oPcNTsLXscSSTn9F3mfFgv5VrlKxD53pogR
         p2ttuUJ85urYi94/nagQdaWj1K/7adwDYy3JI/gb10mAJ/3yY5Lk6dyt11UIFikLmHIK
         XIyqJjRvkegLdrVRqYL10Ik0RRTPyLHH5KYRXa8QHpuspY52M+F6vvrR59nQJLGWWyxx
         iC0Q==
X-Gm-Message-State: AO0yUKWeQb8TxYAdig4INLug5eSfMryrAEl9PDYIzguIIn+9aQ20pEM6
        TqPAOPB8qxFc+rYZVnu7sDQuLsQheR8=
X-Google-Smtp-Source: AK7set+6WHVuff3QTpY/ej1gH2m2jbqm+nEonUTBmy81qvbn1c6ZdfJa2C5Z1/m+iWrtefKa55ndtw==
X-Received: by 2002:a17:902:e3c4:b0:199:151d:d1b5 with SMTP id r4-20020a170902e3c400b00199151dd1b5mr1361512ple.43.1675635584247;
        Sun, 05 Feb 2023 14:19:44 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id i132-20020a62878a000000b005810c4286d6sm5543551pfe.0.2023.02.05.14.19.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Feb 2023 14:19:43 -0800 (PST)
Subject: Re: stack smashing detected
To:     Stan Johnson <userm57@yahoo.com>, debian-68k@lists.debian.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <4a9c1d0d-07aa-792e-921f-237d5a30fc44@yahoo.com>
 <e7574759-4870-d554-dd63-17da220270f1@gmail.com>
 <af524ac9-f5af-e9fb-e33f-0884a0ebfcb6@yahoo.com>
 <8d54f302-0a39-b8c7-4115-5c10c1d3769f@gmail.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <203b8fd4-6618-27a8-7d18-d50e7accfa4b@gmail.com>
Date:   Mon, 6 Feb 2023 11:19:38 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <8d54f302-0a39-b8c7-4115-5c10c1d3769f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Stan,

Am 02.02.2023 um 07:51 schrieb Michael Schmitz:
>
> But since we're touching on copy_to_user() here - the 'remove set_fs'
> patch set by Christoph Hellwig refactored the m68k inline helpers around
> July 2021. Can you test a kernel prior to those patches (5.15-rc2)?
>
>>
>>> That's a lot of work on a 030 Mac - have you tried to reproduce this on
>>> any kind of emulator?
>> I haven't seen the error in QEMU.
>>
>>> I suppose one difference between your 030 and 040 Macs might be the
>>> amount of RAM available. I wonder if this bug results from a combination
>>> of 030 MMU and memory pressure, or 030 MMU only.
>> For some reason, the error seems to happen only with 68030 systems,
>> regardless of processor speed or memory:
>>
>> PB 170      : 68030, 25 MHz, 8 MiB, external SCSI2SD
>> Mac IIci    : 68030, 25 MHz, 80 MiB, internal SCSI2SD
>> SE/30       : 68030, 16 MHz, 128 MiB, external SCSI2SD
>> PB 550c     : 68040, 33 MHz, 36 MiB, external SCSI2SD
>> Centris 650 : 68040, 25 MHz, 136 MiB, internal SCSI2SD
>
> Exception handling in copy_to_user() and the related bits in 030 page
> fault handling might need another look in then...

Seeing Finn's report that Al Viro's VM_FAULT_RETRY fix may have solved 
his task corruption troubles on 040, I just noticed that I probably 
misunderstood how Al's patch works.

Botching up a fault retry and carrying on may well leave the page tables 
in a state where some later access could go to the wrong page and 
manifest as user space corruption. Could you try Al's patch 4 (m68k: fix 
livelock in uaccess) to see if this helps?

Cheers,

	Michael

