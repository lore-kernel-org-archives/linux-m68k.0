From: richard -rw- weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH 0/20] mmu: arch/mm: Port OOM changes to arch page fault handlers.
Date: Tue, 20 Mar 2012 14:36:06 +0100
Message-ID: <CAFLxGvyVbDndbu_2ZbUBwbrJCq+d4rRZW0ROxTpQxAvetRm=0w__29554.7464666472$1332252193$gmane$org@mail.gmail.com>
References: <CAFPAmTQs9dOpQTaXU=6Or66YU+my_CnPw33TE4h++YArBNa38g@mail.gmail.com>
	<CAFLxGvwW2XcYSoidZZ0XF_a-pH3SwONqS+hCnpGUecQ__DLa_g@mail.gmail.com>
	<CAFPAmTSzV9mrkbP68p4PA-0i0o2Hz7JiBY=0A0V_myJEzWubjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAFPAmTSzV9mrkbP68p4PA-0i0o2Hz7JiBY=0A0V_myJEzWubjQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kautuk Consul <consul.kautuk@gmail.com>
Cc: linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux@lists.openrisc.net, linux-am33-list@redhat.com, microblaze-uclinux@itee.uq.edu.au, linux-m68k@lists.linux-m68k.org, linux-m32r-ja@ml.linux-m32r.org, linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-cris-kernel@axis.com, linux-sh@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org

On Tue, Mar 20, 2012 at 2:34 PM, Kautuk Consul <consul.kautuk@gmail.com> wrote:
>>
>> What about arch/um/?
>> Does UML not need this change?
>
> Oh yes, extremely sorry I accidentally missed that one out.
> Mind if I send it separately ?

No problem.
handle_page_fault() is the function you want to patch. :)

-- 
Thanks,
//richard
