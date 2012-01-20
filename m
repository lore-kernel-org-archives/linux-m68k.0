From: "Jensen, Bjarne" <bkj@doms.dk>
Subject: coldfire v4e
Date: Fri, 20 Jan 2012 13:47:07 +0000
Message-ID: <4E469720BAB3C44DA563C197C2E672CF010E5B@DHREUSVXM02.danaher.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>

Hi all,

We are developing an application on a board with a Coldfire v4e processor (m54418) and are wondering if it will be possible to make the kernel preemptive and how much effort it will take. Has anyone tried it with this processor?

I have noticed that when I enable the "MMU-based Paged Memory Management Support" option, the "Preemption Model" option disappears no matter which "Processor type" I choose. Is it simply because it is not implemented or is it just not possible on this type of processors?

Best regards,
Bjarne K. Jensen
Doms Aps

Please be advised that this email may contain confidential 
information.  If you are not the intended recipient, please notify us 
by email by replying to the sender and delete this message.  The 
sender disclaims that the content of this email constitutes an offer 
to enter into, or the acceptance of, any agreement; provided that the 
foregoing does not invalidate the binding effect of any digital or 
other electronic reproduction of a manual signature that is included 
in any attachment.
