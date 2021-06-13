Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA29C48BDF
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Jun 2021 20:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71F8E61285
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Jun 2021 20:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbhFMUuc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Jun 2021 16:50:32 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:44897 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbhFMUub (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 13 Jun 2021 16:50:31 -0400
Received: by mail-lf1-f46.google.com with SMTP id r198so17536816lff.11
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Jun 2021 13:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MZqs6/zzv7XumFdUpj7gOd8uMbZ0+DuSivSIZIp9AxA=;
        b=Ed483c1uODNIoPgUXug7Mxr2cByHXxr+/YdlUGOMwiaTmFcnWwKszK4C6oc8P2iIVC
         lv/+Lt7jAA+K2JKknyXVp+r+H102+o20RuACnEruopjF0Acrdt7JMIBsNitbSda9gR+X
         FgSvv0YOG9XzjmGK/gCBODTjNG9OiWPCLjvzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MZqs6/zzv7XumFdUpj7gOd8uMbZ0+DuSivSIZIp9AxA=;
        b=t/WoLwKVh1o80VjM9m036PmfijvZMkqYUizLVe7WhHsrD7TLcbGKA3haBQ0aFMjwR/
         Aw30ZcT1fxRMRzYAR0oM0tuKiJhD2GAve4WtZv3ST+EPCMkq4fZ99N8BJ0ipK6gP1hnS
         UjLONO7SUZ//UdgOKaRkUECn8yklzYzjNpjDCp6Jig7UTgvVpsD8Z0KrW6uakd4MzDTB
         Xn5qr4N7DezXB2EQ57TGp9Sms0lTJU6Tv3NT7onqmZsvU+nMFP5xSf4FLhCp1KFZ5OlK
         BU4BS6AgJZUg5UM+mMNHxBPw/H6v/+IRE1pE6zmh5EDaeQ2Tk563d/ugiuCm2hpP02TA
         YKvA==
X-Gm-Message-State: AOAM5323bOTBaXXNnou4hkntCifKEPtQgFDSuF5EmX5Q8OYgH3WTa2jb
        Z8ni7pMPRf5/bAMAhVXvPfIx7UMAvBB7f5hL
X-Google-Smtp-Source: ABdhPJycxLcEpfgvWoCYfDoQJHXYAshdviW0IS4Cdybt5tx/PfCTgSufWDrLDVgKxTx5htInt8Vacw==
X-Received: by 2002:ac2:5237:: with SMTP id i23mr10157928lfl.22.1623617248772;
        Sun, 13 Jun 2021 13:47:28 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id i127sm1272299lfd.216.2021.06.13.13.47.28
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jun 2021 13:47:28 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id n17so17276697ljg.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Jun 2021 13:47:28 -0700 (PDT)
X-Received: by 2002:a2e:2ac6:: with SMTP id q189mr11049345ljq.61.1623617248057;
 Sun, 13 Jun 2021 13:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <87sg1p30a1.fsf@disp2133> <1623541098-6532-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=wi2KnsPbv2BOKHa+hb3CmyxsWRQBmSrzqzNezZ=vxH6bg@mail.gmail.com>
 <0a96ad37-dedb-67f3-3b27-1ff521c41083@gmail.com> <CAHk-=whO6fK4xCuEYDmDMVg_WKxP8cu429x7qjEO_k5sYVoMhg@mail.gmail.com>
In-Reply-To: <CAHk-=whO6fK4xCuEYDmDMVg_WKxP8cu429x7qjEO_k5sYVoMhg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 13 Jun 2021 13:47:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgULNXEASR5aoPK2SxHR8O7mEhuBNPrTep+agx6MxhEhg@mail.gmail.com>
Message-ID: <CAHk-=wgULNXEASR5aoPK2SxHR8O7mEhuBNPrTep+agx6MxhEhg@mail.gmail.com>
Subject: Re: [PATCH v1] m68k: save extra registers on sys_exit and
 sys_exit_group syscall entry
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jun 13, 2021 at 1:26 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> They'll probably be complete garbage without the fix.

Actually, never mind. My trivial gdb script is garbage.

I think that even with the fix, it will be fine. Because this test
will just use the regular system call entry tracing point - which gets
the thing right.

It's only PTRACE_EVENT_EXIT reporting that gets it wrong, not the
generic system call tracing case.

I'm not sure if/how you can get gdb to catch that PTRACE_EVENT_EXIT case.

Sorry for my inane noise.

                 Linus
