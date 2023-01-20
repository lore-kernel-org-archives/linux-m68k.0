Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BAFC25B4E
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Jan 2023 14:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbjATOUw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Jan 2023 09:20:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbjATOTe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Jan 2023 09:19:34 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5945FCE215
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Jan 2023 06:19:05 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id s124so4546732oif.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Jan 2023 06:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P+oiB4YqHou3mxYNMHksB44CkluOvs88n4z4riO+ICs=;
        b=WLdvlIE0LvcDnWmO9XJ0gvQoo6q+0+oD7tmDHHkyECpz62Lgz9gc6Ip1n8hynLnfyb
         g5mzuR9Mja8niXxB9bhkNOu+CD3WbYYW7M2dwoV6q4jU/SRfsayhkCRP90dt7OurlaY9
         oNIROWC5jsyQm07FbsRSJhIpMNlrTalHkcpCRptKWt1Kea2YbTgQ3hm1avnCkYkEpObO
         qOhe6I0GMwtzdS1na18rdZvDVkVEuY8FW6eBzbCKGwYbf2bV681wwb5bfNBQPX4JpBs/
         m/6jK3IBi+YeoWEg+GnCMIfYYsDQRch8OQyViz4Hon4ei1A7sbnRcrkO6i9+4LKw92Lt
         SozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+oiB4YqHou3mxYNMHksB44CkluOvs88n4z4riO+ICs=;
        b=isa1TgnI8+9JFwDvhawhXoPusCNKGhEiEAou8rQjIjwDiCEsSCZ+iBDcmtaL5NZMsX
         dnextxrr/3rVqJXvleo5IDj4CEhW+tylqtsffwoWLdsjZ5P8OdANIJhJusNASSD8lL5Y
         vgTt2kUf64rlzYCpttUV03XTJPjENprtL2hCEEIkF9cYBPA2oGkNyCgKXl51d+MGiYb3
         KW+F53PN0CbR2f86MFyKZH+mFZz6cTNtewN4qIjWGomwyhMuE/oHi1bMqXTACexfIZZO
         FAjbR6RQSxKkqfLdFC8vAu/GPV3jApI+9I27QtxiSCR1wJcRbmpuM3e3KA42FTur7gBq
         onqw==
X-Gm-Message-State: AFqh2kqyjZvA6Y6B23EJP1T+cCxZV2iMkAJqnYSfbqOs0+xL4r0+g/Ox
        NuhuCgsxwwWJqIuJ9pu0KbdCyVKAdrrJ6VPY7hs=
X-Google-Smtp-Source: AMrXdXv2S9oKmQyzuSHPaStYEjm/EOiicLnfF3uV581quh65HN+sLlSty5gibmOCq1vBoImQ2WMXKY/nDhM1M1zFl74=
X-Received: by 2002:a54:4708:0:b0:363:b19e:1133 with SMTP id
 k8-20020a544708000000b00363b19e1133mr705111oik.181.1674224258504; Fri, 20 Jan
 2023 06:17:38 -0800 (PST)
MIME-Version: 1.0
References: <40e8c60c-396d-0cde-d702-ab44f53bd26f@physik.fu-berlin.de>
In-Reply-To: <40e8c60c-396d-0cde-d702-ab44f53bd26f@physik.fu-berlin.de>
Reply-To: noloader@gmail.com
From:   Jeffrey Walton <noloader@gmail.com>
Date:   Fri, 20 Jan 2023 09:17:27 -0500
Message-ID: <CAH8yC8=gjpi6+weBkmfGaJtPXBRcLUh78mDcnYMiVaF9ULGHcw@mail.gmail.com>
Subject: Re: LLVM buildbot for m68k backend has been moved to production
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Min-Yih Hsu <minyihh@uci.edu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jan 20, 2023 at 5:51 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> For a number of weeks, the LLVM buildbot which cross-compiles the M68K backend
> has been "green", i.e. builds and testsuite have passed without problems [1].
>
> As a consequence, I have asked the admin of the LLVM buildbot master server to
> move our buildbot from staging to production. After receiving approval yesterday,
> I moved the buildbot to production now [2].
>
> Another step forward in maturing the M68K backend in LLVM. More news on the backend
> coming soon, I'm preparing a longer report.

Good job, Adrian.

Jeff
