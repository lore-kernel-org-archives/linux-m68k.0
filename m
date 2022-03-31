Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CFEC4332F
	for <linux-m68k@archiver.kernel.org>; Thu, 31 Mar 2022 16:06:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234719AbiCaQIS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 31 Mar 2022 12:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239760AbiCaQIH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 31 Mar 2022 12:08:07 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3CE55765
        for <linux-m68k@lists.linux-m68k.org>; Thu, 31 Mar 2022 09:06:19 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id q20so104581wmq.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 31 Mar 2022 09:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=/vW6GKQwBl/KpyF0gls7oQD7ldrjM8IGIWqfV18ZMuM=;
        b=hPERsC32s/4t6+cbogrSTK8txTYpHwZCjSmWuwJ4ndzFDaZNj6Mog+5AZr4sGIeTfC
         nLXwOUIxPPBt3k+/JxNlz4AqP9ThQ26QrxeJu52BQc9NIJbpaeZVjFbK6LMzFNXBthrm
         O9txIBlwPXEz0+iEz26vF3lYpEwoV/3OlB9xhLUHOLMkSWpAci3A+1gl4LzG32LtMlAM
         pJNLGrAzx/UkCjwP/5WGAGlfGhWfDhkAynSjI7w1NV33I/pvJXqo+B0CMNwu+UpoYD3G
         73tpKRWbwKMgb1gc9Tzkq/p7+Z7FWqyC4CToty59GS8Tigz4pxp2nT42RieQZtnaqrga
         EwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=/vW6GKQwBl/KpyF0gls7oQD7ldrjM8IGIWqfV18ZMuM=;
        b=BQhlBGHhm8Dc5VOTQ8Z0whdSlaNVX2PofSgq9PTTDl+QUEKz4qVh9Y/PzYpZH9RPJ3
         HXoU6UgDQz3taHBFf98/2tzf2eIGrFTeP/F33Cg70oDGvnjJ87TzdDISzaU/qT4doEA8
         kI19nYdOIfGw8ivR4deV3beWhvNw0IfhdifA4pWOHHwUI1ugEfPamK4nSJzQHbziV0go
         BmZ+zD8TZC8pxmgDmy0Xi5dlk93+rcM1jp97wMBEcQT8lvzkKyC8QgJQ5fVIyuqxwjNh
         AiWVcjl0l3maCR/zeU44Ueahgvnu67zXk16ByjWko3IWWM/xfDjxGOJUJ7+fQtGNO7Yk
         NvHw==
X-Gm-Message-State: AOAM533Opqi+fyuIdSifjO9Bo/Ab13Hl8qwcNU+aoGjT+rpkDWn0y2tf
        7rSJ/V+s+aFm7IV3vHh2ts+yNpy/fGA=
X-Google-Smtp-Source: ABdhPJwpSAY8Ov4RoGWOKwgFV5k2Qwqk6ijxN1dMb9awY3wwzFJvP0TIl1ZAwyeVCraVJKnUNJyVJg==
X-Received: by 2002:a7b:c382:0:b0:388:2e76:49ed with SMTP id s2-20020a7bc382000000b003882e7649edmr5278473wmj.195.1648742777545;
        Thu, 31 Mar 2022 09:06:17 -0700 (PDT)
Received: from DESKTOP-R5VBAL5 ([39.53.224.185])
        by smtp.gmail.com with ESMTPSA id q6-20020adffec6000000b00205b60faeeesm13391368wrs.24.2022.03.31.09.06.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 31 Mar 2022 09:06:17 -0700 (PDT)
Message-ID: <6245d179.1c69fb81.9f5ec.42ee@mx.google.com>
Date:   Thu, 31 Mar 2022 09:06:17 -0700 (PDT)
X-Google-Original-Date: 31 Mar 2022 12:06:16 -0400
MIME-Version: 1.0
From:   gallegosdreamlandestimation@gmail.com
To:     linux-m68k@lists.linux-m68k.org
Subject: Estimating Services
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0AGallegos Christoper=0D=0ADreamland Estimation, =
LLC

