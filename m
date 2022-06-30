Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88C8C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 30 Jun 2022 15:33:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235914AbiF3Pdg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 30 Jun 2022 11:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235942AbiF3Pd2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 30 Jun 2022 11:33:28 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6346547
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jun 2022 08:33:25 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id q9so27876688wrd.8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jun 2022 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=TFGxfKfYNc6FX30F9sKmEL18XnIK/Iwh98w/L1TSaX4=;
        b=n1Dxpt1D0qY0J7JZFkzFDrqE7uaaauX+yivx1RFxbf/KpjONvUaeLNzMzwAC6O05E1
         gRPqV/46WOYB5QyvTtWL/itlLGAV20REW/Qu5HJdwgL9073I9ffO0/4ydIElYsWFfeyS
         qX9Y/sYHUMp8CAYPcAr/cKOVbOvNstBb1depSct+KHLmHvOxVKAhc2dFvlzMesPVBGiS
         p+aFum+z2wjKJrxQFgL8me1gAf711zEKHtoYIdE3wnM977Mnvj1PquPq64VKxZxUWvBH
         K6cDpQl964P7c1C1cnpavE6gdbL7joiogCzwOSFHYT/CTZxXswYwhG9TbPypCPw/jRF2
         Bovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=TFGxfKfYNc6FX30F9sKmEL18XnIK/Iwh98w/L1TSaX4=;
        b=jdV+9dnwDKtMQZYLDCwHxaZVJLdnTxpdy3neID40B6D5fskyIz89OQxi49usXwQhhT
         MAWmuZ3KJAw45fiMOeSWkcAz4JHS30SnxtA+9qLHRkU6Cq4lCJ09OIOGvz0IP7SsF2Vr
         3KiBKJQ8/dDPEmk+JSIYHTr7326IfjX3Gd2/u9e9yqybjS15XeakB48jW3O7sUHwO/ex
         An6f8RNT3AjihQKnz3IrLxvUfvLK7Jgl7+y6Du5/J+FSxogriHAS1R0BDqgCAue02hKs
         pHqVzxWLA6Pj5tmbVeE9VXLgUNqlQO2l3DlfkU8gGxIEOs5/FWong5Q1jeUG4yZCPbXc
         /3SA==
X-Gm-Message-State: AJIora92Q8zZfXxe32FDILuDATee8KbHvC/E4z6c8J2SPd9kQvwsTaYY
        9cJyJ63iGrL6iB+XJPOuCe5WeUrPT80=
X-Google-Smtp-Source: AGRyM1tfbHV+Xy9SWSa+v+uYpY2UKH0cxmUrza1NNrNTqjG9CgihjxQ1HGNEfuc1HuIC6kLcC+NP7g==
X-Received: by 2002:a5d:6b06:0:b0:21b:902e:5727 with SMTP id v6-20020a5d6b06000000b0021b902e5727mr9038930wrw.86.1656603203467;
        Thu, 30 Jun 2022 08:33:23 -0700 (PDT)
Received: from DESKTOP-L1U6HLH ([39.53.244.205])
        by smtp.gmail.com with ESMTPSA id e2-20020adfdbc2000000b0021b9f126fd3sm20118400wrj.14.2022.06.30.08.33.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 30 Jun 2022 08:33:23 -0700 (PDT)
Message-ID: <62bdc243.1c69fb81.aec93.6df4@mx.google.com>
Date:   Thu, 30 Jun 2022 08:33:23 -0700 (PDT)
X-Google-Original-Date: 30 Jun 2022 11:33:24 -0400
MIME-Version: 1.0
From:   bryce.dreamlamdestimation@gmail.com
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
Kind Regards=0D=0ABryce Weems=0D=0ADreamland Estimation, LLC

