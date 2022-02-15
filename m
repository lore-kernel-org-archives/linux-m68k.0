Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3DAC433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Feb 2022 20:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240127AbiBOUl6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Feb 2022 15:41:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234014AbiBOUl6 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 15 Feb 2022 15:41:58 -0500
X-Greylist: delayed 307 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Feb 2022 12:41:46 PST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2710C0849
        for <linux-m68k@vger.kernel.org>; Tue, 15 Feb 2022 12:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644957705;
        bh=JFXCWCKql48UNlTh7Yst5igG5l8PdTcvllupvHIlkNA=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=NQqQ189z/XYF7YPzvXaaquRWME4odRzWdhwZd850wSAqdL8/0nQeN/X4S/S0YMlSf
         agDKLyUZS/y7m7gabdIJjt6B+gHofsBXyfwY+e5cdsWeC78ik/Th5uL9nbNxW9kLkS
         NoldWtZMBKcLB2KECG6dhQr7tZSxK9OYps1NagkE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.185.100]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mgeo8-1nuVm11o7g-00h94m; Tue, 15
 Feb 2022 21:36:33 +0100
Message-ID: <e29f650b-0362-3210-0cff-3d60289268c3@gmx.de>
Date:   Tue, 15 Feb 2022 21:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/3] video: fbdev: atari: Miscellaneous fixes
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-m68k@vger.kernel.org
References: <20220215112126.2633383-1-geert@linux-m68k.org>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220215112126.2633383-1-geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5i5oc5VahLUo0RFxymkaRjsyilZSwth5e50lwxXduUyW3UQjhFa
 3ZEpcayUb7tQe7k4Yh9AgWly6Q3aZZfYYiaoapOmO0lTlOp5BiLWOGOL0UwtFclaBSpOvc2
 odmGs/+JvT6vDHk8tNOAF5en4d9U0eXKW5jkeZrRG60/a7V2gAtdcNLRvzZ2DYAg7c69KvM
 cA8aNWgm2j6IcI4G85dbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:v9dUPIgA3PY=:7e4OhkVnLztbioHBRjdbci
 fGYd58un5mFnM6xt9jAlQC1hooUR9mkD6TfrhnPgsFgXSzAHGC2C52CIuTfkMHPifRr8MC8n9
 H2QZiV4ucGKZMulV16RoY3PEfW0p6VfgkPJSfCc/7Gaf7ncjzXZ7Y7eUF3dGLQptiFGhn2cI4
 E++lTsG0j+oM1OwWbR5XFM4wzUKsCrKaCzGAY5//w4ZlWlg/J3jbM/CTqzWRMv93WWDktcsB3
 wI2WTu52XOT9x5HHtapTWa4pnPEdyLpfh7p7X0pvbe/P7nUCu9Pv/n5ui0qZWrz4bB1D6JJTU
 0uM6GZsLNtk8OnsEviy7qK4LBAY+gxgXhlzz70EEOKSBv0yfxzWa04tHEGhSNHugKiZS0e/9m
 92wcXgWWIQFPYlRE1IkD0toiwTLhnywcZOAu+Je69hiJeAtO6wQw9u4QvGVAIKnG+CT5VuA6Z
 nSY9OY4DATg7/wSqvXocUXh5ZLHNSjobJjwAhtdmK/ffckuz7hbyn3hj7aZXWaJbbdjP+SkMY
 Jk0Ad53OiuvotVHM/9BnzmrlO0EZz1BmXqiJbp4zuwWFkldImizmOQIUBflLk6AyOpquBS+wq
 FYfPePg8CtU9h6Yh/U/87mpeGQP7f8k50kvv31Z6HuMKztnszMnesLxUljjyQbPDfV6AeBVg/
 vxjoOIYuoHRzP+V+jvsCcNL80XiWD1GMEEWNkejA1k/aElFdZITalIcXyf64iJ0Q1TvflP6tS
 lvmMi0ZnlpSmWdzeQCkn7VqDHYrJNKYPWvxlyU9HQqVmikivaRI8fCraFgXSPDe8UQAoPQANo
 MytemRi9d8MsOmSIppDKxiVDacqZ/rOVGRDTkXHTE+WOWGJpAE=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 2/15/22 12:21, Geert Uytterhoeven wrote:
> This is a small series of miscellaneous fixes for the Atari frame buffer
> device driver.
>
> The first patch has been sent before, and is untested, as I have no
> access to the hardware.
> The other patches have been tested on ARAnyM.
>
> Thanks!
>
> Geert Uytterhoeven (3):
>   video: fbdev: atari: Fix TT High video mode
>   video: fbdev: atari: Convert to standard round_up() helper
>   video: fbdev: atari: Remove unused atafb_setcolreg()
>
>  drivers/video/fbdev/atafb.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)

I've applied all 3 patches to the fbdev for-next tree.

Thank you!

Helge
