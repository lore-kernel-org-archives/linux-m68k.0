From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] nubus: Kill nubus_proc_detach_device()
Date: Fri,  3 May 2013 22:20:38 +0200
Message-ID: <1367612438-26490-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, David Huggins-Daines <dhd@debian.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

Commit 59d8053f1e16904d54ed7469d4b36801ea6b8f2c ("proc: Move non-public
stuff from linux/proc_fs.h to fs/proc/internal.h") broke Apple NuBus
support:

drivers/nubus/proc.c: In function =E2=80=98nubus_proc_detach_device=E2=80=
=99:
drivers/nubus/proc.c:156: error: dereferencing pointer to incomplete ty=
pe
drivers/nubus/proc.c:158: error: dereferencing pointer to incomplete ty=
pe

=46ortunately nubus_proc_detach_device() is unused, and appears to have=
 never
been used, so just remove it.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/nubus/proc.c  |   15 ---------------
 include/linux/nubus.h |    1 -
 2 files changed, 0 insertions(+), 16 deletions(-)

diff --git a/drivers/nubus/proc.c b/drivers/nubus/proc.c
index b8286ed..5371b37 100644
--- a/drivers/nubus/proc.c
+++ b/drivers/nubus/proc.c
@@ -147,21 +147,6 @@ int nubus_proc_attach_device(struct nubus_dev *dev=
)
 }
 EXPORT_SYMBOL(nubus_proc_attach_device);
=20
-/* FIXME: this is certainly broken! */
-int nubus_proc_detach_device(struct nubus_dev *dev)
-{
-	struct proc_dir_entry *e;
-
-	if ((e =3D dev->procdir)) {
-		if (atomic_read(&e->count))
-			return -EBUSY;
-		remove_proc_entry(e->name, proc_bus_nubus_dir);
-		dev->procdir =3D NULL;
-	}
-	return 0;
-}
-EXPORT_SYMBOL(nubus_proc_detach_device);
-
 /*
  * /proc/nubus stuff
  */
diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index b374052..6165b2c 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -87,7 +87,6 @@ static inline void nubus_proc_init(void) {}
 #endif
 int get_nubus_list(char *buf);
 int nubus_proc_attach_device(struct nubus_dev *dev);
-int nubus_proc_detach_device(struct nubus_dev *dev);
 /* If we need more precision we can add some more of these */
 struct nubus_dev* nubus_find_device(unsigned short category,
 				    unsigned short type,
--=20
1.7.0.4
