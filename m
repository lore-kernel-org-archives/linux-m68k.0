Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20229C7618E
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Apr 2023 10:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjDXK2y (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Apr 2023 06:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbjDXK2X (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Apr 2023 06:28:23 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83E45263
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Apr 2023 03:26:27 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f1957e80a2so71779025e9.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Apr 2023 03:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682331986; x=1684923986;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5oucjR4LiiCnKHY41QfHitRWmrt3+NiX+0bii1Hzkk=;
        b=aR2KhA3HRoJD4Eyc8BNLR84uLorhG/Olk+zQ6IY0VyFvVvnB3lm4Zwkzo4uieyYJcW
         YX9lIbHN/CJcZDRtXcnml/AYBjY62brM9x8NVy1hRzrBWGX+SO/y0gtu2E18gUOLqMgR
         0VV8tbR0p5tFGheZx/SA677oyS8QNxfNGf3MRNPcqQUWtPHyYmuVFeNV9RwdBtAGv0nc
         DKMBqH4yfIztGuzwi0uIp6qGUA06FpmaXcm0cYaS27LT8wyQnFkrniz9I8RlnFiC3MIl
         TZvVY7wjIIcBUfXNXn0w2W1T3028RBy1z03hlY8ocZdPdFNuVs79ofvChLsxmiipe1v6
         tTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682331986; x=1684923986;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B5oucjR4LiiCnKHY41QfHitRWmrt3+NiX+0bii1Hzkk=;
        b=Cm8FTMuaToL5xtV0wQerJ44cDSgrN90QWQ0FdgyHgXqVpiPz/JpRcDDPxjkEP9SXru
         M0o3gP8nXQg/Mp8BVFP8B4ckZlFOBQ2JtZabv0lM0bSyWXeUrqvapgI8u+tnVv4sw/lm
         refwLrCAZ5MbBoIbscbUWwPvDPfbO2pcv9s2rthtAw+OMLnfqN4ywV6faf8BwNhLTBHW
         Y59sratkkRzsqbLYEls4xF0EwwxvJA5cO9GO0pYT0/J/oGDhIAdFpEMkL4qV7VFFf6eG
         wA5f+ycOpNq8S+Cg+KgmtAGMnZEAkzFNoNWvyJC9i7oAWt3/vRiVwQk3u/6K8tYT7EyO
         K05Q==
X-Gm-Message-State: AAQBX9f/M6HR6o4XgBsrlmfwSvEogkoK7mrGW5XULxP0uW/VrVQtABsI
        fDnYwxzfemMABGeVcViS4xg=
X-Google-Smtp-Source: AKy350a2Pm3+1kflahXqkr46TL/6sMJBAfEmY41yfvC9yNkUW8VVZkDEsoXqtBsQe9dORiLogA/mQA==
X-Received: by 2002:a1c:e904:0:b0:3ed:3268:5f35 with SMTP id q4-20020a1ce904000000b003ed32685f35mr7437665wmc.18.1682331985707;
        Mon, 24 Apr 2023 03:26:25 -0700 (PDT)
Received: from ?IPv6:::1? ([2a02:3038:205:36e:bef0:403:381:3710])
        by smtp.gmail.com with ESMTPSA id ay37-20020a05600c1e2500b003f18b52c73asm11545446wmb.24.2023.04.24.03.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 03:26:25 -0700 (PDT)
Sender: "Richard Z." <richard.zz.ba@gmail.com>
Date:   Mon, 24 Apr 2023 10:26:22 +0000
From:   Richard Z <rz@linux-m68k.org>
To:     debian-68k@lists.debian.org,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        debian-68k <debian-68k@lists.debian.org>
CC:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>,
        Min-Yih Hsu <minyihh@uci.edu>, Sheng <ox59616e@gmail.com>
Subject: Re: Question on the m68k Calling Convention (RTD)
In-Reply-To: <efb01ccc8cbabd7fc939d3aa1869f68e01157b3a.camel@physik.fu-berlin.de>
References: <efb01ccc8cbabd7fc939d3aa1869f68e01157b3a.camel@physik.fu-berlin.de>
Message-ID: <5802B69A-00F1-45F1-AC2F-E9AFE549A2AE@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On April 23, 2023 11:15:04 AM UTC, John Paul Adrian Glaubitz <glaubitz@phy=
sik=2Efu-berlin=2Ede> wrote:


>Now, the interesting part is the question why the compiler is even trying
>to take this codepath since RTD should normally be turned off in the M68k
>backend by default as it's the case for GCC=2E
>

As you say=2E=2E looks like that codepath should never be taken unless -mr=
td is explicitly asked for=2E=2E so the problem seems to be somewhere in th=
e argument/options parsing logic of the compiler=2E

Richard=20
